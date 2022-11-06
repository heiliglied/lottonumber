import 'package:flutter/material.dart';
import 'package:lotto_number/views/mainpage.dart';

class Routes {
  Routes._();

  static const String main = "/";

  static final routes = <String, WidgetBuilder> {
    main: (BuildContext context) => MainPage()
  };
}