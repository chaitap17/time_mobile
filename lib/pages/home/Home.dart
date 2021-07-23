import 'dart:async';

import 'package:time_mobile/constants/sizes.dart';
import 'package:time_mobile/pages/home/Intimes.dart';
import 'package:time_mobile/pages/home/inarea.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {
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
                        'ชื่อ-นามสกุลผู้ใช้งาน',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'ตำแหน่ง',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                  child: IconButton(
                    iconSize: 30,
                    onPressed: () {},
                    icon: Icon(Icons.power_settings_new),
                  ),
                )
              ],
            ),
          ),
          Row(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 70, 40, 0),
                  child: IconButton(
                      iconSize: 95,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => inarea()));
                      },
                      icon: Icon(Icons.pending_actions)),
                ),
                Text('ลงเวลาปฏิบัติงาน')
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 70, 40, 0),
                  child: IconButton(
                      iconSize: 95, onPressed: () {}, icon: Icon(Icons.hiking)),
                ),
                Text('ลงปฏิบัติงานนอกสถานที่')
              ],
            )
          ]),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(55, 90, 40, 0),
                    child: IconButton(
                        iconSize: 95,
                        onPressed: () {},
                        icon: Icon(Icons.transfer_within_a_station)),
                  ),
                  Text('แจ้งปฏิบัติงานนอกสถานที่')
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
                    child: IconButton(
                        iconSize: 90,
                        onPressed: () {},
                        icon: Icon(Icons.fact_check)),
                  ),
                  Text('อนุมัตการปฏิบัติงาน'),
                  Text('นอกสถานที่')
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
