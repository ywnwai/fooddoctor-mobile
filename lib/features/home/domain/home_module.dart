/// A content scope shown on the home dashboard.
enum HomeModuleId {
  knowledge,
  blog,
  materials,
  consultants,
  jobs,
  industrial,
  myRecords,
}

class HomeModule {
  const HomeModule({
    required this.id,
    required this.title,
    required this.subtitle,
  });

  final HomeModuleId id;
  final String title;
  final String subtitle;
}

class HomeProfilePreview {
  const HomeProfilePreview({
    required this.name,
    required this.role,
    required this.statusLabel,
  });

  final String name;
  final String role;
  final String statusLabel;
}

class HomeQuickStart {
  const HomeQuickStart({
    required this.eyebrow,
    required this.title,
    required this.body,
  });

  final String eyebrow;
  final String title;
  final String body;
}
