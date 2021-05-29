import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:testApp/detailScreen.dart';
import 'package:testApp/homeList.dart';
import 'package:testApp/splash.dart';

import 'User.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/home':
        return PageTransition(
            duration: Duration(seconds: 1),
            child: Home(),
            type: PageTransitionType.fade,
            settings: settings);
      case '/detail':
        if (args is User)
          return PageTransition(
            child: DetailScreen(
              user: args,
            ),
            duration: Duration(seconds: 1),
            type: PageTransitionType.fade,
          );
    }
  }
}
