import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_doctor/core/l10n/locale_controller.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/routing/app_router.dart';
import 'package:food_doctor/core/theme/app_theme.dart';
import 'package:food_doctor/features/cart/domain/selection_cart.dart';
import 'package:food_doctor/features/cart/presentation/cart_scope.dart';
import 'package:food_doctor/features/profile/domain/profile_account.dart';
import 'package:food_doctor/features/profile/presentation/profile_scope.dart';
import 'package:go_router/go_router.dart';

class FoodDoctorApp extends StatefulWidget {
  const FoodDoctorApp({super.key});

  @override
  State<FoodDoctorApp> createState() => _FoodDoctorAppState();
}

class _FoodDoctorAppState extends State<FoodDoctorApp> {
  late final GoRouter _router = createAppRouter();
  late final SelectionCart _cart = SelectionCart();
  late final LocaleController _locale = LocaleController();
  late final ProfileAccount _account = ProfileAccount();

  @override
  void dispose() {
    _router.dispose();
    _cart.dispose();
    _locale.dispose();
    _account.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LocaleScope(
      controller: _locale,
      child: CartScope(
        cart: _cart,
        child: ProfileScope(
          account: _account,
          child: ListenableBuilder(
            listenable: Listenable.merge([_locale, _account]),
            builder: (context, _) {
              return MaterialApp.router(
                title: 'Food Doctor',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light,
                locale: _locale.language.locale,
                supportedLocales: const [
                  Locale('en'),
                  Locale('my'),
                ],
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                routerConfig: _router,
              );
            },
          ),
        ),
      ),
    );
  }
}
