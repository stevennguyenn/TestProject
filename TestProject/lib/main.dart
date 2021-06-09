import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app_router.dart';
import 'component/custom_view/loading_view.dart';
import 'component/utils/shared_preference.dart';
import 'language/localization_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // String token = await SharedPreference.shared.getToken();
  // token = "!";
  final initLocale = await SharedPreference.shared.getLanguageCode();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyAppView(initLocale: initLocale,));
  });
}

class MyAppView extends StatelessWidget {
  MyAppView({this.initLocale});
  final String? initLocale;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Locale?>(
      future: AppTranslations.locale,
      builder: (context, AsyncSnapshot<Locale?> snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return GestureDetector(
            child: GetMaterialApp(
              enableLog: true,
              debugShowCheckedModeBanner: false,
              translations: AppTranslations(),
              locale: data,
              fallbackLocale: AppTranslations.fallbackLocale,
              initialRoute: AppRoutes.home,
              getPages: AppRouter.getPages,
            ),
            onTap: () {
              FocusScopeNode focus = FocusScope.of(context);
              if (!focus.hasPrimaryFocus && focus.focusedChild != null) {
                focus.focusedChild!.unfocus();
              }
            },
          );
        }
        return MaterialApp(
          home: Scaffold(
            body: (Platform.isIOS || Platform.isAndroid) ? LoadingView() : SizedBox(height: 0,),
          ),
        );
      },
    );
  }
}