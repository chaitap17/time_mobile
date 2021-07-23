import 'package:time_mobile/constants/colors.dart';
import 'package:time_mobile/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  Intl.defaultLocale = 'th';
  initializeDateFormatting();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Mobile',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: MyColors.myApp,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      initialRoute: MyRoute.INIT,
      routes: MyRoute.createRoutes(context),
    );
  }
}
