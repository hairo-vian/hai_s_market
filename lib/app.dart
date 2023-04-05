import 'package:flutter/material.dart';
import 'package:hai_market/navigation/route_generator.dart';
import 'package:hai_market/ui/splash/splash_screen.dart';
import 'package:hai_market/util/global_provider.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalProvider(
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.light(),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
