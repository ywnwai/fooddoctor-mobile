import 'package:flutter/widgets.dart';
import 'package:food_doctor/features/profile/domain/profile_account.dart';

class ProfileScope extends InheritedNotifier<ProfileAccount> {
  const ProfileScope({
    super.key,
    required ProfileAccount account,
    required super.child,
  }) : super(notifier: account);

  static ProfileAccount of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ProfileScope>();
    assert(scope != null, 'ProfileScope is missing above this widget.');
    return scope!.notifier!;
  }
}
