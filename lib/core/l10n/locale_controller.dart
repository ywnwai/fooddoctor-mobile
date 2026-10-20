import 'package:flutter/foundation.dart';
import 'package:food_doctor/core/l10n/app_language.dart';
import 'package:food_doctor/core/l10n/app_strings.dart';

class LocaleController extends ChangeNotifier {
  LocaleController({AppLanguage language = AppLanguage.english})
    : _language = language;

  AppLanguage _language;

  AppLanguage get language => _language;

  AppStrings get strings => AppStrings.of(_language);

  void setLanguage(AppLanguage language) {
    if (_language == language) {
      return;
    }
    _language = language;
    notifyListeners();
  }

  void toggle() {
    setLanguage(
      _language == AppLanguage.english
          ? AppLanguage.burmese
          : AppLanguage.english,
    );
  }
}
