enum MaterialTab { raw, packaging, machinery }

class MaterialType {
  const MaterialType({
    required this.id,
    required this.name,
    required this.tab,
    required this.summary,
  });

  final String id;
  final String name;
  final MaterialTab tab;
  final String summary;
}

class MaterialItem {
  const MaterialItem({
    required this.id,
    required this.typeId,
    required this.name,
    required this.description,
    required this.hotline,
  });

  final String id;
  final String typeId;
  final String name;
  final String description;
  final String hotline;
}
