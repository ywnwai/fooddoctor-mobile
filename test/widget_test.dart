import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_doctor/app.dart';

void main() {
  testWidgets('Home shell opens modules from the dashboard and the tabs', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const FoodDoctorApp());
    await tester.pumpAndSettle();

    expect(find.text('GOOD MORNING'), findsOneWidget);
    expect(find.text('Food Doctor'), findsOneWidget);
    expect(find.text('U Mg Mg'), findsOneWidget);
    expect(find.text('Role: User · E-commerce'), findsOneWidget);
    expect(find.text('Knowledge Catalog'), findsOneWidget);
    expect(find.text('Build your food product path'), findsOneWidget);
    expect(find.text('7 scopes'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('nav-Catalog')));
    await tester.pumpAndSettle();
    expect(find.text('Bakery & confectionery'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('nav-Home')));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Build your food product path'));
    await tester.pumpAndSettle();
    expect(find.text('Bakery & confectionery'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('nav-Home')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('module-blog')));
    await tester.pumpAndSettle();
    expect(find.text('Updates and featured articles'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(find.text('Food Doctor'), findsOneWidget);

    await tester.tap(find.byTooltip('Notifications'));
    await tester.pumpAndSettle();
    expect(find.text('Account approved'), findsOneWidget);
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('My Knowledge / My Inquiries'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Job Opportunities'), findsOneWidget);
    expect(find.text('Industrial Directory'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('nav-Materials')));
    await tester.pumpAndSettle();
    expect(find.text('Materials & Machinery'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('nav-Experts')));
    await tester.pumpAndSettle();
    expect(find.text('Profiles and inquiry'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('nav-Profile')));
    await tester.pumpAndSettle();
    expect(find.text('My Knowledge Assets'), findsOneWidget);
  });

  testWidgets('Catalog steps open a knowledge item', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const FoodDoctorApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('nav-Catalog')));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('Bakery & confectionery'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Bakery & confectionery'));
    await tester.pumpAndSettle();
    expect(find.text('1-10 employees'), findsOneWidget);

    await tester.tap(find.text('1-10 employees'));
    await tester.pumpAndSettle();
    expect(find.text('Formulation'), findsOneWidget);

    await tester.tap(find.text('Formulation'));
    await tester.pumpAndSettle();
    expect(
      find.text('Bakery & confectionery formulation overview'),
      findsOneWidget,
    );
  });
}
