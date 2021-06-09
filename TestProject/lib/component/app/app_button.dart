import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/component/constant/color_constant.dart';
import 'package:testproject/component/constant/font_constant.dart';
import 'app_text.dart';

class AppButton {

  static final AppButton shared = AppButton();

  Widget createWidget({
    required String title,
    required bool status,
    VoidCallback? callback,
    FontSize fontSize = FontSize.big,
    FontConstant font = FontConstant.medium,
    TextAlign textAlign = TextAlign.center,
    Color titleColor = Colors.white,
    Color? backgroundColor,
    Color? disableColor,
    required double borderRadius,
    bool hasBorder = false,
    EdgeInsets? padding,
    double minWidth = 44,
    double height = 43
  }) {
    return MaterialButton(
      minWidth: minWidth,
      elevation: 0,
      onPressed: status ? callback : null,
      child: Center(
        child: AppText.shared.createWidget(title, font: font, fontSize: fontSize, color: titleColor),
      ),
      color: backgroundColor,
      padding: padding,
      disabledColor: disableColor,
      height: height,
      splashColor: status ? null : Colors.transparent,
      highlightColor: status ? null : Colors.transparent,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: ColorsConstant.colorOutlineButton,
              width: hasBorder ? 1 : 0,
              style: BorderStyle.solid
          ), borderRadius: BorderRadius.circular(borderRadius)
      ),
    );
  }

  Widget createDefaultButton({required String title,required VoidCallback? onTap,
      Color bgColor = ColorsConstant.colorMain,
      Color titleColor = ColorsConstant.colorDefaultButtonText,
      Color bgDisableColor = ColorsConstant.colorDisableButton,
      FontSize fontSize = FontSize.big,
      FontConstant font = FontConstant.bold,
      TextAlign textAlign = TextAlign.center,
      bool status = true,
      bool hasBorder = false,
      double borderRadius = 0,
      EdgeInsets? padding,
      double minWidth = 44,
      double height = 43
      }) {
    return createWidget(
        title: title, callback: onTap, backgroundColor: bgColor, disableColor: bgDisableColor, font: font,
        titleColor: titleColor, fontSize: fontSize, textAlign: textAlign, hasBorder: hasBorder,
        status: status, borderRadius: borderRadius, padding: padding, minWidth: minWidth, height: height);
  }

  Widget createUnSelectedButton({required String title, required VoidCallback onTap,
    Color bgColor = ColorsConstant.colorWhite,
    Color titleColor = ColorsConstant.colorDefaultButtonText,
    Color bgDisableColor = ColorsConstant.colorDisableButton,
    FontSize fontSize = FontSize.big,
    FontConstant font = FontConstant.medium,
    TextAlign textAlign = TextAlign.center,
    bool status = true,
    bool hasBorder = true,
    double borderRadius = 4,
    EdgeInsets? padding,
    double minWidth = 44,
    double height = 43
  }) {
    return createWidget(
        title: title, callback: onTap, backgroundColor: bgColor, disableColor: bgDisableColor,
        titleColor: titleColor, fontSize: fontSize, font: font, textAlign: textAlign, hasBorder: hasBorder,
        status: status, borderRadius: borderRadius, padding: padding, minWidth: minWidth, height: height);
  }
}