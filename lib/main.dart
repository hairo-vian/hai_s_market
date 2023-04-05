import 'package:hai_market/app.dart';
import 'package:hai_market/database/boxes.dart';
import 'package:hai_market/di/dependency_injection.dart';
import 'package:hai_market/util/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await initializeGetIt();

  await initDatabase();

  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
