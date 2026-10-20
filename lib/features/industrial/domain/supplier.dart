enum SupplierTab { raw, additive, machinery }

class Supplier {
  const Supplier({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.description,
    required this.keywords,
    required this.items,
    required this.social,
    required this.tab,
  });

  final String id;
  final String name;
  final String phone;
  final String email;
  final String description;
  final List<String> keywords;
  final List<String> items;
  final String social;
  final SupplierTab tab;
}
