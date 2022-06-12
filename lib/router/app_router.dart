import 'package:flutter/material.dart';
import 'package:sellfish/home/views/home_screen.dart';
import 'package:sellfish/login/login.dart';
import 'package:sellfish/router/app_constants.dart';
import 'package:sellfish/seller_details/seller_details.dart';
import 'package:sellfish/splash/splash.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case RouteConstants.loginRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => LoginPage(),
        );

      case RouteConstants.homeRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => HomeScreen(),
        );

      case RouteConstants.sellerList:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => SellerList(),
        );

      default:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => SplashScreen(),
        );
    }
  }
}
