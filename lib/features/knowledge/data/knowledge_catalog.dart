import 'package:food_doctor/features/knowledge/domain/knowledge_models.dart';

abstract final class KnowledgeCatalog {
  static const categories = <FoodCategory>[
    FoodCategory(
      id: 'bakery',
      name: 'Bakery & confectionery',
      summary: 'Bread, cakes, and biscuits.',
    ),
    FoodCategory(
      id: 'beverage',
      name: 'Beverages',
      summary: 'Water, juice, and ready-to-drink lines.',
    ),
    FoodCategory(
      id: 'dairy',
      name: 'Dairy',
      summary: 'Milk, yogurt, and cultured drinks.',
    ),
    FoodCategory(
      id: 'snack',
      name: 'Snacks',
      summary: 'Fried, baked, and extruded snacks.',
    ),
    FoodCategory(
      id: 'sauce',
      name: 'Sauces & condiments',
      summary: 'Sauces, pastes, and pickles.',
    ),
  ];

  static const sizes = <BusinessSize>[
    BusinessSize(
      id: 'micro',
      label: '1-10 employees',
      detail: 'A starter plant or a single shift.',
    ),
    BusinessSize(
      id: 'small',
      label: '11-50 employees',
      detail: 'A small factory with a few lines.',
    ),
    BusinessSize(
      id: 'medium',
      label: '51-200 employees',
      detail: 'More than one line and a quality team.',
    ),
  ];

  static const types = <KnowledgeType>[
    KnowledgeType(
      id: 'formulation',
      name: 'Formulation',
      summary: 'Recipes, trials, and how to record a formula.',
    ),
    KnowledgeType(
      id: 'safety',
      name: 'Food safety & GMP',
      summary: 'Hygiene, process control, and plant records.',
    ),
    KnowledgeType(
      id: 'packaging',
      name: 'Packaging',
      summary: 'Pack format, labels, and shelf life.',
    ),
    KnowledgeType(
      id: 'licensing',
      name: 'Licensing',
      summary: 'Product notifications and licences before sale.',
    ),
  ];

  static FoodCategory? categoryById(String id) => _firstWhere(categories, id);

  static BusinessSize? sizeById(String id) => _firstWhere(sizes, id);

  static KnowledgeType? typeById(String id) => _firstWhere(types, id);

  static List<KnowledgeItem> itemsFor({
    required String categoryId,
    required String sizeId,
    required String typeId,
  }) {
    final category = categoryById(categoryId);
    final size = sizeById(sizeId);
    final type = typeById(typeId);
    if (category == null || size == null || type == null) {
      return const [];
    }
    final notes = switch (type.id) {
      'formulation' =>
        'Ingredient roles, trial batches, and how to write the formula down.',
      'safety' =>
        'GMP basics, hygiene, and the records a plant of this size should keep.',
      'packaging' =>
        'Pack format, the label panel, and a simple shelf-life check.',
      'licensing' =>
        'Which notifications to prepare before the product is sold.',
      _ => 'Practical notes for this step.',
    };
    return [
      KnowledgeItem(
        id: '$categoryId-$sizeId-$typeId-overview',
        categoryId: categoryId,
        sizeId: sizeId,
        typeId: typeId,
        title: '${category.name} ${type.name.toLowerCase()} overview',
        description:
            'For a ${category.name.toLowerCase()} business with ${size.label}. $notes',
        isFree: true,
        priceKyat: 0,
      ),
      KnowledgeItem(
        id: '$categoryId-$sizeId-$typeId-practice',
        categoryId: categoryId,
        sizeId: sizeId,
        typeId: typeId,
        title: '${category.name} ${type.name.toLowerCase()} practice notes',
        description:
            'A paid working note for ${size.label}. $notes Use it with your own trials and plant records.',
        isFree: false,
        priceKyat: 150000,
      ),
    ];
  }

  static KnowledgeItem? itemById(String id) {
    for (final category in categories) {
      for (final size in sizes) {
        for (final type in types) {
          for (final item in itemsFor(
            categoryId: category.id,
            sizeId: size.id,
            typeId: type.id,
          )) {
            if (item.id == id) {
              return item;
            }
          }
        }
      }
    }
    return null;
  }

  static T? _firstWhere<T extends Object>(List<T> values, String id) {
    for (final value in values) {
      if (_idOf(value) == id) {
        return value;
      }
    }
    return null;
  }

  static String _idOf(Object value) {
    return switch (value) {
      FoodCategory category => category.id,
      BusinessSize size => size.id,
      KnowledgeType type => type.id,
      _ => '',
    };
  }
}
