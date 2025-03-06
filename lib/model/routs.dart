
import 'package:flutter/cupertino.dart';
import '../view/detailsScreen.dart';
import '../view/mainScreen.dart';
import '../view/splashScreen.dart';

class Routes {
  Map<String, WidgetBuilder> routeMap = {
    MainScreen.route: (context) => const MainScreen(),
    SplashScreen.route: (context) => const SplashScreen(),
    DetailsScreen.route: (context) => const DetailsScreen(),
  };
}