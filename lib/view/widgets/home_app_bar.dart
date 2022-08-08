import 'package:flutter/material.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({
    Key? key,
    Color? backgroundColor,
    Color? foregroundColor,
    Widget? title,
    Widget? leading,
    List<Widget>? actions,
  }) : super(
          key: key,
          backgroundColor: backgroundColor ?? Colors.white,
          foregroundColor: foregroundColor ?? Colors.black,
          title: title,
          leading: leading,
          actions: actions,
          elevation: 0,
        );
}
