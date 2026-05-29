import 'package:control_card_prototype/core/constants/enums.dart';

/// Abstract class of DataState with generic type T
abstract class DataState<T> {
  /// Constructor for DataState with optional parameters
  const DataState({this.data, this.status});

  /// Data of type T
  final T? data;

  /// Status of type String
  final StatusCode? status;
}

/// Class of DataLoading with generic type T
class DataSuccess<T> extends DataState<T> {
  /// Constructor for DataSuccess with required parameter data of type T
  const DataSuccess(T data) : super(data: data);
}

/// Class of DataFailed with generic type T
class DataFailed<T> extends DataState<T> {
  /// Constructor for DataFailed with optional parameter error or status
  DataFailed({super.status});
}

/// Class of DataFailed with generic type T
class NetworkFailed<T> extends DataState<T> {
  /// Constructor for DataFailed with optional parameter error or status
  NetworkFailed({super.status});
}
