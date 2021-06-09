import 'package:flutter/cupertino.dart';
import 'package:testproject/component/constant/color_constant.dart';
import 'package:get/get.dart';
import 'package:testproject/language/app_localizations_key.dart';
import '../app/app_text.dart';

class NoDataView extends StatelessWidget {
  NoDataView({this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText.shared.createDefaultText(
          message ?? AppLocalizationKey.noData.tr.toUpperCase(),
          color: ColorsConstant.colorTextGreyHintTextField
      ),
    );
  }
}