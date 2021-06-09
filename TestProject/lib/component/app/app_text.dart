import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/component/constant/color_constant.dart';
import 'package:testproject/component/constant/font_constant.dart';

class AppText {

  static final AppText shared = AppText();

  Widget createWidget(
      String text, {
        FontConstant? font,
        FontSize? fontSize,
        FontStyle? fontStyle,
        TextOverflow? textOverflow,
        Color? color,
        TextAlign? textAlign,
        int? maxLines,
        TextDecoration textDecoration = TextDecoration.none
      }) {
    return Text(
      text.tr,
      style: TextStyle(
        fontFamily: font.getFont,
        fontSize: fontSize.getSize,
        fontStyle: fontStyle,
        color: color,
        decoration: textDecoration,
      ),
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }

  Widget createDefaultText(
        String text, {
        Color color = ColorsConstant.colorDefaultText,
        FontSize fontSize = FontSize.medium,
        FontConstant font = FontConstant.regular,
        TextAlign textAlign = TextAlign.left,
        FontStyle? fontStyle,
        int? maxLines,
        TextOverflow? textOverflow,
        TextDecoration textDecoration = TextDecoration.none
      }){
    return createWidget(text, color: color, fontSize: fontSize, font: font, textAlign: textAlign,
        fontStyle: fontStyle, maxLines: maxLines, textOverflow: textOverflow, textDecoration: textDecoration);
  }

  Widget createDefaultTitle(
      String text, {
        Color color = ColorsConstant.colorDefaultText,
        FontSize fontSize = FontSize.medium,
        FontConstant font = FontConstant.medium,
        TextAlign textAlign = TextAlign.center,
        FontStyle? fontStyle,
        int? maxLines,
        TextOverflow textOverflow = TextOverflow.ellipsis,
        TextDecoration textDecoration = TextDecoration.none
      }){
    return createWidget(text, color: color, fontSize: fontSize, font: font, textAlign: textAlign,
        fontStyle: fontStyle, maxLines: maxLines, textOverflow: textOverflow, textDecoration: textDecoration);
  }

  Widget createDefaultHeader(
      String text, {
        Color color = ColorsConstant.colorDefaultText,
        FontSize fontSize = FontSize.bigger,
        FontConstant font = FontConstant.semiBold,
        TextAlign textAlign = TextAlign.center,
        FontStyle? fontStyle,
        int? maxLines,
        TextOverflow textOverflow = TextOverflow.ellipsis
      }){
    return createWidget(text, color: color, fontSize: fontSize, font: font, textAlign: textAlign,
        fontStyle: fontStyle, maxLines: maxLines, textOverflow: textOverflow);
  }
}