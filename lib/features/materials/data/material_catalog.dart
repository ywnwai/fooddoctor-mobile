import 'package:food_doctor/features/materials/domain/material_item.dart';

abstract final class MaterialCatalog {
  static const types = <MaterialType>[
    MaterialType(
      id: 'citric-acid',
      name: 'Citric acid',
      tab: MaterialTab.raw,
      summary: 'Acidulant for beverages and sauces.',
    ),
    MaterialType(
      id: 'palm-oil',
      name: 'Palm oil',
      tab: MaterialTab.raw,
      summary: 'Frying and filling fat.',
    ),
    MaterialType(
      id: 'wheat-flour',
      name: 'Wheat flour',
      tab: MaterialTab.raw,
      summary: 'Bread, biscuit, and noodle flour.',
    ),
    MaterialType(
      id: 'white-sugar',
      name: 'White sugar',
      tab: MaterialTab.raw,
      summary: 'Refined sugar for general processing.',
    ),
    MaterialType(
      id: 'carton',
      name: 'Carton',
      tab: MaterialTab.packaging,
      summary: 'Shippers for bottles, jars, and pouches.',
    ),
    MaterialType(
      id: 'glass-jar',
      name: 'Glass jar',
      tab: MaterialTab.packaging,
      summary: 'Jars for sauces, pastes, and pickles.',
    ),
    MaterialType(
      id: 'pet-bottle',
      name: 'PET bottle',
      tab: MaterialTab.packaging,
      summary: 'Bottles for water and juice.',
    ),
    MaterialType(
      id: 'pouch',
      name: 'Stand-up pouch',
      tab: MaterialTab.packaging,
      summary: 'Pouches for powders and snacks.',
    ),
    MaterialType(
      id: 'filler',
      name: 'Filling machine',
      tab: MaterialTab.machinery,
      summary: 'Liquid and paste fillers.',
    ),
    MaterialType(
      id: 'mixer',
      name: 'Planetary mixer',
      tab: MaterialTab.machinery,
      summary: 'Mixers for batter, dough, and paste.',
    ),
    MaterialType(
      id: 'sealer',
      name: 'Sealing machine',
      tab: MaterialTab.machinery,
      summary: 'Pouch and cup sealers.',
    ),
    MaterialType(
      id: 'spares',
      name: 'Spare parts',
      tab: MaterialTab.machinery,
      summary: 'Seals, belts, and nozzles.',
    ),
  ];

  static List<MaterialType> typesFor(MaterialTab tab) {
    final list = types.where((type) => type.tab == tab).toList();
    list.sort((a, b) => a.name.compareTo(b.name));
    return list;
  }

  static MaterialType? typeById(String id) {
    for (final type in types) {
      if (type.id == id) {
        return type;
      }
    }
    return null;
  }

  static List<MaterialItem> itemsFor(String typeId) {
    final type = typeById(typeId);
    if (type == null) {
      return const [];
    }
    return [
      MaterialItem(
        id: '$typeId-standard',
        typeId: typeId,
        name: '${type.name}, standard grade',
        description:
            'A common specification for a small or medium food plant. Confirm the unit before you send an inquiry.',
        hotline: '09 420 110 220',
      ),
      MaterialItem(
        id: '$typeId-plant',
        typeId: typeId,
        name: '${type.name}, plant pack',
        description:
            'Packed for a production line. The inquiry should say the pack size and how soon you need it.',
        hotline: '09 420 110 221',
      ),
    ];
  }

  static MaterialItem? itemById(String typeId, String itemId) {
    for (final item in itemsFor(typeId)) {
      if (item.id == itemId) {
        return item;
      }
    }
    return null;
  }
}
