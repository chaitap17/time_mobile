import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_mobile/pages/home/Home.dart';

class showintime extends StatefulWidget {
  const showintime({Key key}) : super(key: key);

  @override
  _showintimeState createState() => _showintimeState();
}

DateTime myDateTime = DateTime.now();

class _showintimeState extends State<showintime> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat.yMMMd();

    return Scaffold(
      body: Column(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(35),
                child: Column(
                  children: [
                    Text('ยืนยันการลงเวลาทำงาน',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Text('วันที่ ${formatter.format(myDateTime)} ',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Text('เวลา ${now.hour}:${now.minute}:${now.second}น.',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Text('ชื่อสถานที่',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          Row()
        ],
      ),
    );
  }
}
