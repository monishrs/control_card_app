import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:control_card_prototype/config/localization/l10n/app_localizations.dart';
import 'package:control_card_prototype/config/routes/navigate_router.dart';
import 'package:control_card_prototype/config/theme/app_theme.dart';
import 'package:control_card_prototype/injection_container.dart';
import 'package:control_card_prototype/presentation/news/cubits/remote_article_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<RemoteArticleCubit>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        routerConfig: NavigateRouter.router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
