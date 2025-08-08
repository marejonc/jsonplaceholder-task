import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tcb_recru_task/l10n/app_localizations.dart';
import 'package:tcb_recru_task/presentation/navigation/router/app_router.dart';
import 'package:tcb_recru_task/presentation/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData.light().copyWith(extensions: [AppTheme.light()]),
      darkTheme: ThemeData.dark().copyWith(extensions: [AppTheme.dark()]),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
