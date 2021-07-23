import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCircleAvatar extends StatefulWidget {
  final bool enableRouteToProfile;
  final String userId;
  final ImageProvider backgroundImage;
  final double radius;
  final Function onTap;

  const MyCircleAvatar({
    Key key,
    @required this.backgroundImage,
    this.userId,
    this.radius = 0,
    this.enableRouteToProfile = true,
    this.onTap,
  }) : super(key: key);

  @override
  _MyCircleAvatarState createState() => _MyCircleAvatarState();
}

class _MyCircleAvatarState extends State<MyCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.enableRouteToProfile) {
          // TODO add code for go to profile page
        }
        if (widget.onTap != null) {
          widget.onTap();
        }
      },
      child: CircleAvatar(
        radius: widget.radius != 0 ? widget.radius : 22,
        backgroundColor: Colors.grey,
        backgroundImage: widget.backgroundImage,
      ),
    );
  }
}
