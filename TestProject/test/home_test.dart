import 'package:test/test.dart';
import 'package:testproject/module/home/home_controller.dart';

void main() {
  group('Home', () {
    final homeController = HomeController();
    test('add user aaaa', () {
      homeController.addUser("aaa");
      expect(homeController.listUser.length, 1);
    });
    test('add user bbb', () {
      homeController.addUser("bbb");
      expect(homeController.listUser.length, 2);
    });
    test('add user ddd', () {
      homeController.addUser("ddd");
      expect(homeController.listUser.length, 3);
    });
    test('remove user at 0', () {
      homeController.deleteUser(0);
      expect(homeController.listUser.first.name, "bbb");
    });
    test('remove user at 0', () {
      homeController.deleteUser(0);
      expect(homeController.listUser.first.name, "ddd");
    });
    test('change status user at 0', () {
      homeController.changeStatusUser(0);
      expect(homeController.listUser.first.isEnable, true);
    });
    test('change status user at 0', () {
      homeController.changeStatusUser(0);
      expect(homeController.listUser.first.isEnable, false);
    });
  });
}
