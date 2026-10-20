import 'package:flutter/widgets.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

void popOrGoHome(BuildContext context) {
  if (context.canPop()) {
    context.pop();
    return;
  }
  context.go(AppRoutes.home);
}
