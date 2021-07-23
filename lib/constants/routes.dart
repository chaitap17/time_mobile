import 'package:time_mobile/components/MyLoading.dart';
import 'package:time_mobile/pages/home/Home.dart';
import 'package:flutter/material.dart';

class MyRoute {
  static const String INIT = '/';
  static const String HOME = '/home';
  static const String LOADING = '/loading';

  static createRoutes(context) {
    var routes = {
      MyRoute.INIT: (BuildContext context) => MyHomePage(),
      MyRoute.HOME: (BuildContext context) => MyHomePage(),
      MyRoute.LOADING: (BuildContext context) => MyLoading(),
    };
    return routes;
  }
}
