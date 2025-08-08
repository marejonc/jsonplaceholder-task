import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:tcb_recru_task/core/injectable.dart';
import 'package:tcb_recru_task/presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  configureDependencies();

  runApp(HookedBlocConfigProvider(child: const App()));
}
