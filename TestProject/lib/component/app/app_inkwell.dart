import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppInkwell {

  static final AppInkwell shared = AppInkwell();

  createWidget({Widget? child, VoidCallback? onTap, double padding = 0, bool showShadow = false}) {
    return CupertinoButton(
        padding: EdgeInsets.all(0),
        minSize: 5,
        borderRadius: BorderRadius.circular(0),
        child: padding != 0 ? Container(
          padding: EdgeInsets.all(padding),
          child: child,
        ) : child!, onPressed: onTap
    );
  }
}