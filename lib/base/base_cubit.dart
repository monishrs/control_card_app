import 'package:flutter_bloc/flutter_bloc.dart';

/// A base cubit class that provides a common
/// mechanism to handle loading/busy state
/// for asynchronous operations.
abstract class BaseCubit<State> extends Cubit<State> {
  /// Constructor to initialize the cubit
  /// with the given initial state.
  BaseCubit(super.initialState);

  /// Internal flag to track whether
  /// an async operation is in progress.
  bool _isBusy = false;

  /// Public getter to check if the cubit
  /// is currently executing a task.
  bool get isBusy => _isBusy;

  /// Executes an asynchronous action safely.
  ///
  /// Prevents multiple API calls or tasks
  /// from running simultaneously by checking
  /// the [_isBusy] flag.
  ///
  /// Example:
  /// ```dart
  /// run(() async {
  ///   await fetchData();
  /// });
  /// ```
  Future<void> run(Future<void> Function() action) async {
    /// Skip execution if another task
    /// is already running.
    if (_isBusy) return;

    /// Mark cubit as busy.
    _isBusy = true;

    try {
      /// Execute the async action.
      await action();
    } finally {
      /// Reset busy state after completion,
      /// even if an exception occurs.
      _isBusy = false;
    }
  }
}
