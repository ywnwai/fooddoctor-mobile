import 'package:food_doctor/features/home/domain/home_module.dart';

/// Local preview for the home dashboard.
///
/// Card copy follows the home wireframe and the home-screen brief.
/// It is display content, not a second business specification.
abstract final class HomePreviewData {
  static const greeting = 'GOOD MORNING';
  static const productName = 'Food Doctor';
  static const scopeLabel = '7 scopes';

  static const profile = HomeProfilePreview(
    name: 'U Mg Mg',
    role: 'Role: User · E-commerce',
    statusLabel: 'Logged in',
  );

  static const quickStart = HomeQuickStart(
    eyebrow: 'QUICK START',
    title: 'Build your food product path',
    body:
        'Browse business types → size → functionalities → unlock knowledge after purchase.',
  );

  static const modules = <HomeModule>[
    HomeModule(
      id: HomeModuleId.knowledge,
      title: 'Knowledge Catalog',
      subtitle: '49 business types · Buy access',
    ),
    HomeModule(
      id: HomeModuleId.blog,
      title: 'Blog',
      subtitle: 'Video, PDF, audio & more',
    ),
    HomeModule(
      id: HomeModuleId.materials,
      title: 'Materials & Machinery',
      subtitle: 'Chemical raw materials',
    ),
    HomeModule(
      id: HomeModuleId.consultants,
      title: 'Consultants',
      subtitle: 'Expert profiles · Inquiry',
    ),
    HomeModule(
      id: HomeModuleId.jobs,
      title: 'Job Opportunities',
      subtitle: 'Food industry careers',
    ),
    HomeModule(
      id: HomeModuleId.industrial,
      title: 'Industrial Directory',
      subtitle: 'Suppliers & manufacturers',
    ),
    HomeModule(
      id: HomeModuleId.myRecords,
      title: 'My Knowledge / My Inquiries',
      subtitle: 'Purchased knowledge · Inquiries',
    ),
  ];
}
