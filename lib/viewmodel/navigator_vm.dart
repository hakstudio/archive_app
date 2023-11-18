import 'package:flutter/material.dart';

class NavigatorVM {
  static push(BuildContext context, Widget widget) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }
}
