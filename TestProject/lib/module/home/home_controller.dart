import 'dart:io';

import 'package:get/get.dart';
import 'package:testproject/component/service/entity/user_entity.dart';

class HomeController extends GetxController {

  RxBool isLoading = false.obs;
  RxList<UserEntity> listUser = RxList();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  showLoading() {
    if (Platform.isIOS || Platform.isAndroid) {
      isLoading.value = true;
    }
  }

  hideLoading() {
    isLoading.value = false;
  }

  fetchData() async {
    showLoading();
    await Future.delayed(Duration(seconds: 1));
    hideLoading();
  }

  addUser(String userName) {
    final user = UserEntity(name: userName);
    listUser.add(user);
    listUser.refresh();
  }

  changeStatusUser(int index) {
    listUser[index].isEnable = !listUser[index].isEnable;
    listUser.refresh();
  }

  deleteUser(int index) {
    listUser.removeAt(index);
    listUser.refresh();
  }
}