import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/component/app/app_button.dart';
import 'package:testproject/language/app_localizations_key.dart';
import '../../constant/color_constant.dart';
import '../../constant/font_constant.dart';
import 'package:get/get.dart';

class DialogMessage extends StatelessWidget {
  DialogMessage({this.message, this.callback});

  final String? message;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              message == null ? "" : message!.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSize.big.getSize,
                fontFamily: FontConstant.regular.getFont,
                color: ColorsConstant.colorDefaultText,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 165,
              child: AppButton.shared.createDefaultButton(title: AppLocalizationKey.close,
                  onTap: () {
                if (callback != null) callback!();
                Navigator.pop(context);
              }),
            )
          ]
      ),
    );
  }
}
