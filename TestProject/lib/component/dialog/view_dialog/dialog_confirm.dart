import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/component/app/app_button.dart';
import 'package:testproject/component/app/app_navigator.dart';
import 'package:testproject/component/app/app_text.dart';
import 'package:testproject/language/app_localizations_key.dart';
import '../../constant/color_constant.dart';
import '../../constant/font_constant.dart';

class DialogConfirm extends StatelessWidget {
  DialogConfirm({this.message});
  final String? message;

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
            AppText.shared.createDefaultText(
                message ?? "",
                color: ColorsConstant.colorMain,
                font: FontConstant.bold,
                fontSize: FontSize.big
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: AppButton.shared.createDefaultButton(
                      title: AppLocalizationKey.close,
                      bgColor: ColorsConstant.colorDivider,
                      titleColor: ColorsConstant.colorTextGrey,
                      onTap: () {
                        AppNavigator.back();
                      }
                  ),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: AppButton.shared.createDefaultButton(
                      title: AppLocalizationKey.confirm,
                      onTap: () {
                        AppNavigator.back(data: true);
                      }
                  ),
                ),
              ],
            )
          ]
      ),
    );
  }
}
