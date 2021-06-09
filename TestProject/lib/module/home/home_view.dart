import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/component/app/app_inkwell.dart';
import 'package:testproject/component/custom_view/loading_view.dart';
import 'package:testproject/component/custom_view/no_data_view.dart';
import 'package:testproject/component/constant/color_constant.dart';
import 'package:testproject/component/dialog/dialog_provider.dart';
import 'package:testproject/component/extension/extension_appbar.dart';
import 'package:testproject/language/app_localizations_key.dart';
import 'package:testproject/module/home/home_controller.dart';
import 'package:testproject/module/home/item/home_item.dart';

class HomeView extends StatelessWidget {

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExtensionAppbar.createAppBarWithoutBackButton(AppLocalizationKey.homeScreen.tr),
      body: Stack(
        children: [
          SizedBox(height: double.infinity,),
          Column(
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppInkwell.shared.createWidget(
                    child: Icon(Icons.add_box_rounded, color: ColorsConstant.colorMain, size: 24,),
                    onTap: () async {
                      final result = await DialogProvider.shared.showAddUserDialog();
                      if (result != null) {
                        final userName = result as String;
                        if (userName.replaceAll(" ", "") == "") {
                          DialogProvider.shared.showMessageDialog(AppLocalizationKey.pleaseEnterUserName.tr);
                        } else {
                          controller.addUser(userName);
                        }
                      }
                    }
                  ),
                  SizedBox(width: 12,),
                ],
              ),
              SizedBox(height: 12,),
              Expanded(
                child: Obx(() {
                  final listUser = controller.listUser;
                  final isLoading = controller.isLoading.value;
                  if (isLoading && listUser.length == 0) {
                    return SizedBox(height: 0,);
                  }
                  if (listUser.length == 0) {
                    return NoDataView();
                  }
                  return ListView.builder(
                    padding: EdgeInsets.only(bottom: 20),
                    itemBuilder: (context, index) {
                      return HomeItem(
                        user: listUser[index],
                        callbackClickDelete: () async {
                          final result = await DialogProvider.shared.showConfirmDialog(AppLocalizationKey.confirmDeleteUser.tr);
                          if (result != null) {
                            controller.deleteUser(index);
                          }
                        },
                        callbackClickStatus: () async {
                          final result = await DialogProvider.shared.showConfirmDialog(
                             listUser[index].isEnable ? AppLocalizationKey.confirmDisableUser.tr : AppLocalizationKey.confirmEnableUser.tr
                          );
                          if (result != null) {
                            controller.changeStatusUser(index);
                          }
                        },
                      );
                    },
                    itemCount: listUser.length,
                  );
                }),
              )
            ],
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return LoadingView();
            }
            return SizedBox(height: 0,);
          })
        ],
      ),
    );
  }
}