import 'package:control_card_prototype/common_lib.dart';

/// ------------------------------------------------------------
/// HOME SCREEN
/// ------------------------------------------------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen(this.title, {super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(title)));
  }
}
