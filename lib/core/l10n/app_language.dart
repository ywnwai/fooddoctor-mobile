import 'package:flutter/material.dart';

enum AppLanguage {
  english,
  burmese;

  Locale get locale => switch (this) {
    AppLanguage.english => const Locale('en'),
    AppLanguage.burmese => const Locale('my'),
  };

  String get code => switch (this) {
    AppLanguage.english => 'en',
    AppLanguage.burmese => 'my',
  };

  String get nativeLabel => switch (this) {
    AppLanguage.english => 'English',
    AppLanguage.burmese => 'မြန်မာ',
  };

  static AppLanguage fromCode(String? code) {
    return code == 'my' ? AppLanguage.burmese : AppLanguage.english;
  }
}
