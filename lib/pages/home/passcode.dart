import 'package:flutter/material.dart';

class passcode extends StatefulWidget {
  const passcode({Key key}) : super(key: key);

  @override
  _passcodeState createState() => _passcodeState();
}

class _passcodeState extends State<passcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
            child: Row(
              children: [
                Image.asset(
                  'images/man.png',
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Column(
                    children: [
                      Text(
                        'ชื่อ-นามสกุลผู้ใช่งาน',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'ตำแหน่ง',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row()
        ],
      ),
    );
  }
}
