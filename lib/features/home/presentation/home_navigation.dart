import 'package:flutter/material.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/features/home/domain/home_module.dart';
import 'package:go_router/go_router.dart';

enum HomeOpenMode { tab, page }

HomeOpenMode openModeFor(HomeModuleId id) {
  return switch (id) {
    HomeModuleId.blog ||
    HomeModuleId.jobs ||
    HomeModuleId.industrial => HomeOpenMode.page,
    HomeModuleId.knowledge ||
    HomeModuleId.materials ||
    HomeModuleId.consultants ||
    HomeModuleId.myRecords => HomeOpenMode.tab,
  };
}

String routeForHomeModule(HomeModuleId id) {
  return switch (id) {
    HomeModuleId.knowledge => AppRoutes.catalog,
    HomeModuleId.blog => AppRoutes.blog,
    HomeModuleId.materials => AppRoutes.materials,
    HomeModuleId.consultants => AppRoutes.experts,
    HomeModuleId.jobs => AppRoutes.jobs,
    HomeModuleId.industrial => AppRoutes.industrial,
    HomeModuleId.myRecords => AppRoutes.profile,
  };
}

void openHomeModule(BuildContext context, HomeModuleId id) {
  final route = routeForHomeModule(id);
  switch (openModeFor(id)) {
    case HomeOpenMode.tab:
      context.go(route);
    case HomeOpenMode.page:
      context.push(route);
  }
}

String? markForHomeModule(HomeModuleId id) {
  return switch (id) {
    HomeModuleId.jobs => 'JD',
    HomeModuleId.industrial => 'ID',
    _ => null,
  };
}

IconData? iconForHomeModule(HomeModuleId id) {
  return switch (id) {
    HomeModuleId.knowledge => Icons.list_alt_rounded,
    HomeModuleId.blog => Icons.play_arrow_rounded,
    HomeModuleId.materials => Icons.factory_outlined,
    HomeModuleId.consultants => Icons.mood_outlined,
    HomeModuleId.myRecords => Icons.bookmarks_outlined,
    HomeModuleId.jobs || HomeModuleId.industrial => null,
  };
}
