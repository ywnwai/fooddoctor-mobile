import 'package:flutter/widgets.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/routing/main_shell.dart';
import 'package:food_doctor/features/auth/presentation/forgot_password_screen.dart';
import 'package:food_doctor/features/auth/presentation/login_screen.dart';
import 'package:food_doctor/features/auth/presentation/register_screen.dart';
import 'package:food_doctor/features/blog/presentation/blog_detail_screen.dart';
import 'package:food_doctor/features/blog/presentation/blog_screen.dart';
import 'package:food_doctor/features/cart/presentation/cart_screen.dart';
import 'package:food_doctor/features/experts/presentation/expert_detail_screen.dart';
import 'package:food_doctor/features/experts/presentation/experts_screen.dart';
import 'package:food_doctor/features/home/presentation/home_screen.dart';
import 'package:food_doctor/features/industrial/presentation/industrial_screen.dart';
import 'package:food_doctor/features/industrial/presentation/supplier_detail_screen.dart';
import 'package:food_doctor/features/inquiry/presentation/inquiry_screen.dart';
import 'package:food_doctor/features/jobs/presentation/job_detail_screen.dart';
import 'package:food_doctor/features/jobs/presentation/jobs_screen.dart';
import 'package:food_doctor/features/knowledge/presentation/capacity_screen.dart';
import 'package:food_doctor/features/knowledge/presentation/catalog_screen.dart';
import 'package:food_doctor/features/knowledge/presentation/knowledge_detail_screen.dart';
import 'package:food_doctor/features/knowledge/presentation/knowledge_list_screen.dart';
import 'package:food_doctor/features/knowledge/presentation/knowledge_type_screen.dart';
import 'package:food_doctor/features/materials/presentation/material_detail_screen.dart';
import 'package:food_doctor/features/materials/presentation/material_type_screen.dart';
import 'package:food_doctor/features/materials/presentation/materials_screen.dart';
import 'package:food_doctor/features/notifications/presentation/notifications_screen.dart';
import 'package:food_doctor/features/profile/presentation/account_screen.dart';
import 'package:food_doctor/features/profile/presentation/my_inquiries_screen.dart';
import 'package:food_doctor/features/profile/presentation/my_knowledge_screen.dart';
import 'package:food_doctor/features/profile/presentation/password_screen.dart';
import 'package:food_doctor/features/profile/presentation/profile_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter createAppRouter() {
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.home,
    routes: [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.catalog,
                builder: (context, state) => const CatalogScreen(),
                routes: [
                  GoRoute(
                    path: 'category/:categoryId',
                    builder: (context, state) => CapacityScreen(
                      categoryId: state.pathParameters['categoryId']!,
                    ),
                    routes: [
                      GoRoute(
                        path: 'size/:sizeId',
                        builder: (context, state) => KnowledgeTypeScreen(
                          categoryId: state.pathParameters['categoryId']!,
                          sizeId: state.pathParameters['sizeId']!,
                        ),
                        routes: [
                          GoRoute(
                            path: 'type/:typeId',
                            builder: (context, state) => KnowledgeListScreen(
                              categoryId: state.pathParameters['categoryId']!,
                              sizeId: state.pathParameters['sizeId']!,
                              typeId: state.pathParameters['typeId']!,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.materials,
                builder: (context, state) => const MaterialsScreen(),
                routes: [
                  GoRoute(
                    path: 'type/:typeId',
                    builder: (context, state) => MaterialTypeScreen(
                      typeId: state.pathParameters['typeId']!,
                    ),
                    routes: [
                      GoRoute(
                        path: 'item/:itemId',
                        builder: (context, state) => MaterialDetailScreen(
                          typeId: state.pathParameters['typeId']!,
                          itemId: state.pathParameters['itemId']!,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.experts,
                builder: (context, state) => const ExpertsScreen(),
                routes: [
                  GoRoute(
                    path: ':expertId',
                    builder: (context, state) => ExpertDetailScreen(
                      expertId: state.pathParameters['expertId']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const ProfileScreen(),
                routes: [
                  GoRoute(
                    path: 'account',
                    builder: (context, state) => const AccountScreen(),
                  ),
                  GoRoute(
                    path: 'password',
                    builder: (context, state) => const PasswordScreen(),
                  ),
                  GoRoute(
                    path: 'knowledge',
                    builder: (context, state) => const MyKnowledgeScreen(),
                  ),
                  GoRoute(
                    path: 'inquiries',
                    builder: (context, state) => const MyInquiriesScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/knowledge/:itemId',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => KnowledgeDetailScreen(
          itemId: state.pathParameters['itemId']!,
        ),
      ),
      GoRoute(
        path: AppRoutes.blog,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const BlogScreen(),
        routes: [
          GoRoute(
            path: ':postId',
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) => BlogDetailScreen(
              postId: state.pathParameters['postId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.jobs,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const JobsScreen(),
        routes: [
          GoRoute(
            path: ':jobId',
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) =>
                JobDetailScreen(jobId: state.pathParameters['jobId']!),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.industrial,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const IndustrialScreen(),
        routes: [
          GoRoute(
            path: 'supplier/:supplierId',
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) => SupplierDetailScreen(
              supplierId: state.pathParameters['supplierId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.cart,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: AppRoutes.inquiry,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const InquiryScreen(),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
    ],
  );
}
