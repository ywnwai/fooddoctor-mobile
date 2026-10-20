class Expert {
  const Expert({
    required this.id,
    required this.name,
    required this.role,
    required this.description,
    required this.phone,
    required this.email,
    required this.social,
    required this.articleIds,
  });

  final String id;
  final String name;
  final String role;
  final String description;
  final String phone;
  final String email;
  final String social;
  final List<String> articleIds;
}
