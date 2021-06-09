import 'dart:collection';
import 'dart:ui';
import 'package:get/get.dart';

import '../component/utils/shared_preference.dart';
import 'en_us.dart';
import 'vi_vn.dart';

class AppTranslations extends Translations {

  late String? text;

  static final locale = _getLocaleFromLanguage();

  static final fallbackLocale = Locale('vi', 'VN');

  static final langCodes = [
    'en',
    'vi',
  ];

  static final locales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];

  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
  });


  static changeLocale(String langCode) async {
    await SharedPreference.shared.setLanguageCode(langCode);
    final locale = await _getLocaleFromLanguage(langCode: langCode);
    if (locale == null) {return;}
    Get.updateLocale(locale);
    // eventBus.fire(ChangeLanguage());
  }

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'vi_VN': vi,
  };

  static Future<Locale?> _getLocaleFromLanguage({String? langCode}) async {
    final currentLocale = await SharedPreference.shared.getLanguageCode();
    var lang = langCode ?? currentLocale;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale;
  }
}