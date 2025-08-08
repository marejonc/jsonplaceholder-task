import 'package:flutter/material.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:tcb_recru_task/core/injectable.dart';
import 'package:tcb_recru_task/l10n/app_localizations.dart';
import 'package:tcb_recru_task/presentation/navigation/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return HookedBlocConfigProvider(
      injector: () => getIt.get,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
