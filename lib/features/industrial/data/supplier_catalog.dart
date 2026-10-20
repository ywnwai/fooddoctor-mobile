import 'package:food_doctor/features/industrial/domain/supplier.dart';

abstract final class SupplierCatalog {
  static const suppliers = <Supplier>[
    Supplier(
      id: 'golden-grain',
      name: 'Golden Grain Supply',
      phone: '09 250 441 100',
      email: 'hello@goldengrain.example',
      description:
          'Flour, rice, and starch for bakeries and snack plants in Yangon and Mandalay.',
      keywords: const ['flour', 'rice', 'starch'],
      items: const ['Wheat flour', 'Rice flour', 'Tapioca starch'],
      social: 'facebook.com/goldengrain.example',
      tab: SupplierTab.raw,
    ),
    Supplier(
      id: 'shwe-rice',
      name: 'Shwe Rice Ingredients',
      phone: '09 250 441 180',
      email: 'trade@shwerice.example',
      description:
          'Broken rice and rice flour for extrusion and traditional snacks.',
      keywords: const ['rice', 'snack', 'extrusion'],
      items: const ['Broken rice', 'Rice flour'],
      social: 'facebook.com/shwerice.example',
      tab: SupplierTab.raw,
    ),
    Supplier(
      id: 'ayeyar-taste',
      name: 'Ayeyar Taste Lab',
      phone: '09 430 220 014',
      email: 'lab@ayeyartaste.example',
      description:
          'Flavours, colours, and preservatives supplied with a specification sheet.',
      keywords: const ['flavour', 'colour', 'preservative'],
      items: const ['Vanilla flavour', 'Citric acid', 'Sorbic acid'],
      social: 'facebook.com/ayeyartaste.example',
      tab: SupplierTab.additive,
    ),
    Supplier(
      id: 'pure-acid',
      name: 'Pure Acid Trading',
      phone: '09 430 220 090',
      email: 'sales@pureacid.example',
      description: 'Food-grade acids for beverages, sauces, and pickles.',
      keywords: const ['acid', 'beverage', 'pickle'],
      items: const ['Citric acid', 'Acetic acid'],
      social: 'facebook.com/pureacid.example',
      tab: SupplierTab.additive,
    ),
    Supplier(
      id: 'delta-process',
      name: 'Delta Process Machines',
      phone: '09 510 778 300',
      email: 'sales@deltaprocess.example',
      description:
          'Mixers, fillers, and sealers for small and medium food lines.',
      keywords: const ['mixer', 'filler', 'sealer'],
      items: const ['Planetary mixer', 'Piston filler', 'Band sealer'],
      social: 'facebook.com/deltaprocess.example',
      tab: SupplierTab.machinery,
    ),
    Supplier(
      id: 'yangon-parts',
      name: 'Yangon Line Parts',
      phone: '09 510 778 344',
      email: 'parts@yangonline.example',
      description: 'Spare parts and service for filling and packing lines.',
      keywords: const ['spare', 'seal', 'nozzle'],
      items: const ['Sealing belts', 'Filler nozzles', 'Gaskets'],
      social: 'facebook.com/yangonline.example',
      tab: SupplierTab.machinery,
    ),
  ];

  static List<Supplier> forTab(SupplierTab tab, {String query = ''}) {
    final needle = query.trim().toLowerCase();
    final list = suppliers.where((supplier) {
      if (supplier.tab != tab) {
        return false;
      }
      if (needle.isEmpty) {
        return true;
      }
      final haystack = [
        supplier.name,
        supplier.phone,
        ...supplier.keywords,
      ].join(' ').toLowerCase();
      return haystack.contains(needle);
    }).toList();
    list.sort((a, b) => a.name.compareTo(b.name));
    return list;
  }

  static Supplier? byId(String id) {
    for (final supplier in suppliers) {
      if (supplier.id == id) {
        return supplier;
      }
    }
    return null;
  }
}
