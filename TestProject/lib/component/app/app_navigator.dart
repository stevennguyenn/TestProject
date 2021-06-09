import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppNavigator {

  static Future<dynamic>? pushName(String routeName, {dynamic arguments}) async {
    return Get.toNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> bottomSheet(Widget widget, {dynamic arguments}) async {
    Get.bottomSheet(widget, isScrollControlled: true);
  }

  static Future<dynamic>? pushReplaceName(String routeName, {dynamic arguments}) async {
    return Get.offNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> back({dynamic data}) async {
    return Get.back(result: data);
  }
}
