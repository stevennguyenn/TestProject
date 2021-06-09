import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/component/app/app_inkwell.dart';
import 'package:testproject/component/app/app_navigator.dart';
import 'package:testproject/component/constant/font_constant.dart';

import '../constant/color_constant.dart';

class ExtensionAppbar {
  static PreferredSize createAppBar(String title) {
    return PreferredSize(
      child: AppBar(
        centerTitle: true,
        elevation: 0,
        brightness: Brightness.light,
        title: Text(
          title,
          style: TextStyle(
              fontFamily: FontConstant.bold.getFont,
              fontSize: FontSize.bigger.getSize,
              color: ColorsConstant.colorMain),
        ),
        backgroundColor: ColorsConstant.colorWhite,
        leadingWidth: 40,
        leading: BackButtonCustom(),
      ),
      preferredSize: Size.fromHeight(44),
    );
  }

  static PreferredSize createTransparentAppbar(String title) {
    return PreferredSize(
      child: AppBar(
        centerTitle: true,
        elevation: 0,
        brightness: Brightness.light,
        title: Text(
          title,
          style: TextStyle(
              fontFamily: FontConstant.bold.getFont,
              fontSize: FontSize.bigger.getSize,
              color: ColorsConstant.colorMain),
        ),
        backgroundColor: Colors.transparent,
        leadingWidth: 40,
        leading: BackButtonCustom(),
      ),
      preferredSize: Size.fromHeight(44),
    );
  }

  static PreferredSize createAppBarWithoutBackButton(String title) {
    return PreferredSize(
      child: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        brightness: Brightness.light,
        title: Text(
          title,
          style: TextStyle(
              fontFamily: FontConstant.bold.getFont,
              fontSize: FontSize.bigger.getSize,
              color: ColorsConstant.colorMain
          ),
        ),
        backgroundColor: ColorsConstant.colorWhite,
      ),
      preferredSize: Size.fromHeight(44),
    );
  }
}

class BackButtonCustom extends StatelessWidget {
  BackButtonCustom({this.callback});
  final VoidCallback? callback;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppInkwell.shared.createWidget(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Icon(Icons.arrow_back_ios, size: 22, color: ColorsConstant.colorTextGrey,),
          ), onTap: () {
        if (callback != null) {
          callback!();
        } else {
          AppNavigator.back();
        }
      }, padding: 5),
    );
  }
}
