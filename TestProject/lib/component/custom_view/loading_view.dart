import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant/color_constant.dart';

class LoadingView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Platform.isIOS ?
                CupertinoActivityIndicator(animating: true, radius: 12) : (
                    Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(ColorsConstant.colorMain),
                      ),
                    )
                )
              ],
            ),
          ),
        ),
        SizedBox.expand(
          child: Container(
            color: Colors.transparent,
          ),
        )
      ],
    );
  }
}