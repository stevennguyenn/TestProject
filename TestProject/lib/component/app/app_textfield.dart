import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testproject/component/constant/color_constant.dart';
import 'package:testproject/component/constant/font_constant.dart';

enum BorderInputStyle { none, styleDefault, styleDefaultWithBorder, styleFocus, styleError }

extension BorderInputStyleExtension on BorderInputStyle {
  InputBorder getBorder({double radius = 4}) {
    switch (this) {
      case BorderInputStyle.none:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
              width: 1, color: Colors.transparent),
        );
      case BorderInputStyle.styleDefault:
        return OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.solid,
          ),
        );
      case BorderInputStyle.styleDefaultWithBorder:
        return OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: BorderSide(
            width: 1,
            color: ColorsConstant.colorDivider
          ),
        );
      case BorderInputStyle.styleFocus:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
              width: 1.5,
              color: Color(0xffb1b2b4)
          ),
        );
      case BorderInputStyle.styleError:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
              width: 1, color: Colors.red.withOpacity(0.8)),
        );
      default:
        return InputBorder.none;
    }
  }
}

class AppTextField {
  static final AppTextField shared = AppTextField();

  Widget createWidget({
    BuildContext? context,
    String? hintKey,
    String? labelKey = "",
    bool isPassword = false,
    bool showEye = false,
    double padding = 10,
    ValueChanged<String>? textChanged,
    ValueChanged<String>? textDone,
    FocusNode? currentNode,
    FocusNode? nextNode,
    FontSize fontSize = FontSize.medium,
    Color? fillColor,
    Color textColor = Colors.black,
    Color hintColor = Colors.grey,
    FontConstant font = FontConstant.regular,
    int? maxLines,
    BorderInputStyle borderEnable = BorderInputStyle.none,
    BorderInputStyle borderFocus = BorderInputStyle.none,
    VoidCallback? callbackSelectEye,
    TextAlign textAlign = TextAlign.start,
    TextInputType? textInputType = TextInputType.text,
    TextEditingController? controller,
    TextInputAction? textInputAction = TextInputAction.done,
    bool isEnable = true,
    bool onlyNumber = false,
    double radius = 4,
    bool showClear = false,
  }) {
    return TextField(
      enabled: isEnable,
      maxLines: maxLines,
      controller: controller,
      textInputAction: textInputAction,
      inputFormatters: onlyNumber ? <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ] : null,
      decoration: InputDecoration(
        fillColor: fillColor,
          focusedBorder: borderFocus.getBorder(radius: radius),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: borderEnable.getBorder(radius: radius),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Colors.grey.shade200
            ),
          ),
          isDense: true,
          filled: true,
          contentPadding: EdgeInsets.all(padding),
          hintStyle: TextStyle(
            fontSize: fontSize.getSize,
            fontFamily: font.getFont,
            color: hintColor,
          ),
          suffixStyle: TextStyle(
              fontSize: fontSize.getSize,
              fontFamily: font.getFont,
              color: textColor),
          labelStyle: TextStyle(
              fontSize: fontSize.getSize,
              fontFamily: font.getFont,
              color: hintColor),
          hintText: hintKey != null ? hintKey.tr : "",
          labelText: labelKey != "" ? labelKey?.tr : "",
          suffixIcon: showEye
              ? InkWell(
            onTap: () {
              if (callbackSelectEye != null) {
                callbackSelectEye();
              }
            },
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                isPassword ? Icons.visibility : Icons.visibility_off,
                size: 20,
                color: ColorsConstant.colorDefaultText.withOpacity(0.5),
              ),
            ),
          ) : (showClear && controller != null) ? InkWell(
            onTap: () {
              controller.text = "";
            },
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.clear,
                size: 20,
                color: ColorsConstant.colorDefaultText.withOpacity(0.5),
              ),
            ),
          ) : null),
      style: TextStyle(
          fontSize: fontSize.getSize,
          fontFamily: font.getFont,
          color: isEnable ? textColor : Colors.grey),
      textAlign: textAlign,
      onChanged: textChanged,
      keyboardType: onlyNumber ? TextInputType.number : textInputType,
      focusNode: currentNode,
      onEditingComplete: (){
        if (nextNode != null) {
          FocusScope.of(context!).requestFocus(nextNode);
        } else {
          if (context != null) {
            FocusScope.of(context).unfocus();
          }
        }
      },
      onSubmitted: (text) {
        if (textDone != null) {
          textDone(text);
        }
      },
      obscureText: isPassword,
      readOnly: !isEnable,
      enableSuggestions: false,
      autocorrect: false,
    );
  }
}
