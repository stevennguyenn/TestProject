import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:testproject/module/home/home_view.dart';

class AppRoutes {
  static final home = "/home";
}


class AppRouter {
  static final getPages = [
    GetPage(
        name: AppRoutes.home,
        page: () => HomeView(),
    ),
  ];
}