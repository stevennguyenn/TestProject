import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/component/dialog/view_dialog/dialog_add_user.dart';
import 'package:testproject/component/dialog/view_dialog/dialog_confirm.dart';

import 'view_dialog/dialog_message.dart';

class DialogProvider {

  static final DialogProvider shared = DialogProvider();

  void showMessageDialog(String message, {VoidCallback? callback}) {
    Get.generalDialog(
        pageBuilder: (context, _ , __) => DialogMessage(message: message, callback: callback),
        barrierDismissible: false
    );
  }

  Future<dynamic> showAddUserDialog() {
    return Get.generalDialog(
        pageBuilder: (context, _, __) => DialogAddUser(),
        barrierDismissible: false
    );
  }

  Future<dynamic> showConfirmDialog(String? message) {
    return Get.generalDialog(
        pageBuilder: (context, _, __) => DialogConfirm(message: message,),
        barrierDismissible: false
    );
  }
}
