import 'package:firebasedemo/Routers/routersName.dart';
import 'package:firebasedemo/view/WLoginScreen.dart';
import 'package:firebasedemo/view/locationScr.dart';
import 'package:firebasedemo/view/weatherScr.dart';
import 'package:flutter/material.dart';

import '../view/splashScre.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutersName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutersName.wloginScreen:
        return MaterialPageRoute(builder: (context) => const WLoginScreen());
      case RoutersName.locationscreen:
        return MaterialPageRoute(builder: (context) => const LocationScreen());

      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Text('${settings.name}'),
          );
        });
    }
  }
}
