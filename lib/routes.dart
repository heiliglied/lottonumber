import 'package:flutter/material.dart';
import 'package:lotto_number/views/mainpage.dart';
import 'package:lotto_number/views/splash.dart';

class Routes {
  Routes._();

  static const String splash = "/splash";
  static const String main = "/";

  static final routes = <String, WidgetBuilder> {
    main: (BuildContext context) => MainPage(),
    splash: (BuildContext context) => SplashPage(),
  };
}