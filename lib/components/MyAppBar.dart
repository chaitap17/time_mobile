import 'package:time_mobile/constants/colors.dart';
import 'package:time_mobile/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final double titleSpacing;
  final Widget customTitle;
  final String subTitle;
  final List<Widget> actions;
  final PreferredSizeWidget bottom;
  final bool centerTitle;
  final Function onBack;
  final Widget leading;
  final bool isLeading;
  final Color bgColor;
  final Brightness brightness;
  final double elevation;

  MyAppBar({
    Key key,
    this.title,
    this.titleSpacing,
    this.customTitle,
    this.bgColor = MyColors.bgAppBar,
    this.subTitle,
    this.leading,
    this.actions = const [],
    this.centerTitle = true,
    this.bottom,
    this.onBack,
    this.isLeading = true,
    this.elevation = 0,
    this.brightness = Brightness.dark,
  })  : preferredSize = MySizes.sizeAppBar,
        super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  final Size preferredSize;
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    Widget _leading = widget.isLeading
        ? widget.leading != null
            ? widget.leading
            : Container(
                padding: widget.centerTitle
                    ? EdgeInsets.zero
                    : EdgeInsets.only(left: 5),
                child: MyAppBarWidget.iconBack(context, onBack: widget.onBack),
              )
        : null;
    return AppBar(
      elevation: widget.elevation,
      brightness: widget.brightness,
      backgroundColor: widget.bgColor,
      centerTitle: widget.centerTitle,
      title: widget.customTitle != null
          ? widget.customTitle
          : widget.subTitle != null
              ? MyAppBarWidget.titleWithSubtitle(widget.title, widget.subTitle)
              : MyAppBarWidget.title(widget.title),
      titleSpacing: widget.titleSpacing ?? 15,
      leadingWidth: widget.centerTitle ? null : 40,
      leading: _leading,
      actions: widget.actions,
      automaticallyImplyLeading: widget.isLeading,
    );
  }
}

class MyAppBarWidget {
  static Widget iconBack(
    BuildContext context, {
    Function onBack,
    Color color = MyColors.fontAppBar,
  }) {
    return InkWell(
      child: Icon(
        Icons.chevron_left_sharp,
        color: color,
        size: MySizes.iconSizeXXLarge,
      ),
      onTap: () {
        if (onBack != null) {
          onBack();
        } else {
          Navigator.of(context).pop();
        }
      },
    );
  }

  static Widget title(String title) {
    return Text(
      title != null ? title : "",
      style: TextStyle(
        color: MyColors.fontAppBar,
        fontWeight: FontWeight.bold,
        fontSize: MySizes.fontSizeLarge,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  static Widget subtitle(String subtitle) {
    return Text(
      subtitle != null ? subtitle : "",
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: MySizes.fontSizeSmall,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  static Widget titleWithSubtitle(String title, String subTitle) {
    return Column(
      children: <Widget>[
        Text(
          title != null ? title : "",
          style: TextStyle(
            color: MyColors.fontAppBar,
            fontWeight: FontWeight.bold,
            fontSize: MySizes.fontSizeMedium,
          ),
        ),
        Text(
          subTitle != null ? subTitle : "",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: MySizes.fontSizeSmall,
          ),
        )
      ],
    );
  }
}
