import 'package:flutter/widgets.dart';
import 'package:food_doctor/core/l10n/app_strings.dart';
import 'package:food_doctor/core/l10n/locale_controller.dart';

class LocaleScope extends InheritedNotifier<LocaleController> {
  const LocaleScope({
    super.key,
    required LocaleController controller,
    required super.child,
  }) : super(notifier: controller);

  static LocaleController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LocaleScope>();
    assert(scope != null, 'LocaleScope is missing above this widget.');
    return scope!.notifier!;
  }

  static AppStrings stringsOf(BuildContext context) => of(context).strings;
}

extension AppL10nX on BuildContext {
  AppStrings get l10n => LocaleScope.stringsOf(this);

  LocaleController get localeController => LocaleScope.of(this);
}
