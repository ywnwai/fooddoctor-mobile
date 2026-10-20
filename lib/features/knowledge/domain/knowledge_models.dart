class FoodCategory {
  const FoodCategory({
    required this.id,
    required this.name,
    required this.summary,
  });

  final String id;
  final String name;
  final String summary;
}

class BusinessSize {
  const BusinessSize({
    required this.id,
    required this.label,
    required this.detail,
  });

  final String id;
  final String label;
  final String detail;
}

class KnowledgeType {
  const KnowledgeType({
    required this.id,
    required this.name,
    required this.summary,
  });

  final String id;
  final String name;
  final String summary;
}

class KnowledgeItem {
  const KnowledgeItem({
    required this.id,
    required this.categoryId,
    required this.sizeId,
    required this.typeId,
    required this.title,
    required this.description,
    required this.isFree,
    required this.priceKyat,
  });

  final String id;
  final String categoryId;
  final String sizeId;
  final String typeId;
  final String title;
  final String description;
  final bool isFree;
  final int priceKyat;
}
