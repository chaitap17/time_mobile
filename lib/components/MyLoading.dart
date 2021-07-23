import 'package:time_mobile/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Key scaffoldKey = Key("LOADING");

class MyLoading extends StatefulWidget {
  final bool darkMode;

  const MyLoading({Key key, this.darkMode = false}) : super(key: key);

  @override
  _MyLoadingState createState() => _MyLoadingState();
}

class _MyLoadingState extends State<MyLoading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.darkMode ? Colors.black : Colors.white,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(MyColors.loadingCircle),
        ),
      ),
    );
  }
}
