import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/component/app/app_button.dart';
import 'package:testproject/component/app/app_navigator.dart';
import 'package:testproject/component/app/app_text.dart';
import 'package:testproject/component/app/app_textfield.dart';
import 'package:testproject/language/app_localizations_key.dart';
import '../../constant/color_constant.dart';
import '../../constant/font_constant.dart';
import 'package:get/get.dart';

class DialogAddUser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    String content = "";
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
              AppLocalizationKey.addUser.tr,
              color: ColorsConstant.colorMain,
              font: FontConstant.bold,
              fontSize: FontSize.biggest
            ),
            SizedBox(
              height: 20,
            ),
            AppTextField.shared.createWidget(
              context: context,
              maxLines: 1,
              font: FontConstant.regular,
              hintKey: AppLocalizationKey.enterUserName.tr,
              padding: 12,
              textChanged: (text) {
                content = text;
              }
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
                        AppNavigator.back(data: content);
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
