import 'package:time_mobile/pages/home/Home.dart';
import 'package:time_mobile/pages/home/confirm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class inarea extends StatefulWidget {
  const inarea({Key key}) : super(key: key);

  @override
  _inareaState createState() => _inareaState();
}

DateTime myDateTime = DateTime.now();

class _inareaState extends State<inarea> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat.yMMMd();

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
                Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                    child: IconButton(
                        iconSize: 30,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        },
                        icon: Icon(Icons.home)))
              ],
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 30, 0, 0),
                    child: SizedBox(
                      width: 180,
                      child: Text(
                        'วันที่ ${formatter.format(myDateTime)}'
                        '       เวลา ${now.hour}:${now.minute}:${now.second}น.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                    child: IconButton(
                        iconSize: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => confirm()));
                        },
                        icon: Icon(Icons.fingerprint)),
                  ),
                  Text('ลงเวลา')
                ],
              ),
            ],
          ),
          Column(
            children: [
              Padding(padding: const EdgeInsets.all(50.50)),
            ],
          )
        ],
      ),
    );
  }
}
