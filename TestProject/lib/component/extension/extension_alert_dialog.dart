import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/component/constant/font_constant.dart';
import 'package:testproject/language/app_localizations_key.dart';
import 'package:get/get.dart';

class ExtensionAlertDialog {

  static var isShow = false;

  static void showAlertError(BuildContext context, String? message) {
    showCupertinoDialog(context: context, builder: (BuildContext context) {
      return CupertinoAlertDialog(
        content: Text(message!, style: TextStyle(
            color: Colors.black,
            fontFamily: FontConstant.regular.getFont,
            fontSize: 16
        ),),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(AppLocalizationKey.close.tr, style: TextStyle(
                fontSize: 15,
                fontFamily: FontConstant.regular.getFont,
                color: Colors.blue
            ),),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      );
    });
  }

  static void showAlertErrorWithCallback(BuildContext context, String message, VoidCallback callback) {
    showCupertinoDialog(context: context, builder: (BuildContext context) {
      return CupertinoAlertDialog(
        content: Text(message, style: TextStyle(
            color: Colors.black,
            fontFamily: FontConstant.regular.getFont,
            fontSize: 16
        ),),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(AppLocalizationKey.close.tr, style: TextStyle(
                fontSize: 15,
                fontFamily: FontConstant.regular.getFont,
                color: Colors.blue
            ),),
            onPressed: (){
              Navigator.pop(context);
              callback();
            },
          ),
        ],
      );
    });
  }

  static void showAlertErrorToken(BuildContext context, String message) {
    if (!isShow) {
      ExtensionAlertDialog.isShow = true;
      showCupertinoDialog(context: context, builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Text(message, style: TextStyle(
              color: Colors.black,
              fontFamily: FontConstant.regular.getFont,
              fontSize: 16
          ),),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(AppLocalizationKey.close.tr, style: TextStyle(
                  fontSize: 15,
                  fontFamily: FontConstant.regular.getFont,
                  color: Colors.blue
              ),),
              onPressed: (){
                ExtensionAlertDialog.isShow = false;
                if (message == "Phiên bản đăng nhập đã quá hạn. Vui lòng đăng nhập lại để sử dụng ứng dụng!") {
                  Navigator.popUntil(context, (route) => route.isFirst);
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      });
    }
  }

  static void alertConfirm(BuildContext context, String message, VoidCallback callback) {
    showCupertinoDialog(context: context, builder: (BuildContext context) {
      return CupertinoAlertDialog(
        content: Text(message, style: TextStyle(
            color: Colors.black,
            fontFamily: FontConstant.regular.getFont,
            fontSize: 16
        ),),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text(AppLocalizationKey.confirm.tr, style: TextStyle(
                fontSize: 15,
                fontFamily: FontConstant.regular.getFont,
                color: Colors.blue
            ),),
            onPressed: (){
              Navigator.pop(context);
              callback();
            },
          ),
          CupertinoDialogAction(
            child: Text(AppLocalizationKey.close.tr, style: TextStyle(
                fontSize: 15,
                fontFamily: FontConstant.regular.getFont,
                color: Colors.blue
            ),),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      );
    });
  }
}