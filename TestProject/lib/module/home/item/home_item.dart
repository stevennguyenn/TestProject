import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/component/app/app_inkwell.dart';
import 'package:testproject/component/app/app_text.dart';
import 'package:testproject/component/constant/color_constant.dart';
import 'package:testproject/component/service/entity/user_entity.dart';

class HomeItem extends StatelessWidget {
  HomeItem({this.user, this.callbackClickStatus, this.callbackClickDelete});

  final UserEntity? user;
  final VoidCallback? callbackClickStatus;
  final VoidCallback? callbackClickDelete;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12, left: 12, right: 12),
      decoration: BoxDecoration(
        color: ColorsConstant.colorWhite,
        boxShadow: [
          BoxShadow(
            color: ColorsConstant.colorDefaultText.withOpacity(0.1),
            offset: Offset(0,2),
            blurRadius: 5,
            spreadRadius: 2
          ),
        ]
      ),
      child: Row(
        children: [
          Expanded(
            child: AppText.shared.createDefaultText(user?.name ?? ""),
          ),
          SizedBox(width: 10,),
          AppInkwell.shared.createWidget(
            child: Icon(
              !(user?.isEnable ?? false) ? Icons.check_box_outline_blank : Icons.check_box,
              color: ColorsConstant.colorMain,
              size: 24,
            ),
            onTap: () {
              callbackClickStatus!();
            }
          ),
          SizedBox(width: 5,),
          AppInkwell.shared.createWidget(
              child: Icon(
                Icons.delete,
                color: ColorsConstant.colorTextRed,
                size: 24,
              ),
              onTap: () {
                callbackClickDelete!();
              }
          ),
        ],
      ),
    );
  }
}