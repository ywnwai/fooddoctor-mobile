import 'package:food_doctor/features/experts/domain/expert.dart';

abstract final class ExpertCatalog {
  static const experts = <Expert>[
    Expert(
      id: 'u-khin-maung',
      name: 'U Khin Maung',
      role: 'Food technologist',
      description:
          'Works with bakeries and snack plants on formulas, trials, and scale-up from the bench to a line.',
      phone: '09 250 880 101',
      email: 'khin.maung@fooddoctor.example',
      social: 'facebook.com/fooddoctor.example',
      articleIds: ['label-check', 'allergen'],
    ),
    Expert(
      id: 'daw-su-mon',
      name: 'Daw Su Mon',
      role: 'Quality lead',
      description:
          'Sets up GMP records, hygiene checks, and lot release for plants with one or two shifts.',
      phone: '09 250 880 202',
      email: 'su.mon@fooddoctor.example',
      social: 'facebook.com/fooddoctor.example',
      articleIds: ['gmp-walk', 'water-log'],
    ),
    Expert(
      id: 'dr-htet-aung',
      name: 'Dr. Htet Aung',
      role: 'Packaging specialist',
      description:
          'Advises on pack format, shelf life, and the label panel for sauces, drinks, and snacks.',
      phone: '09 250 880 303',
      email: 'htet.aung@fooddoctor.example',
      social: 'facebook.com/fooddoctor.example',
      articleIds: ['cold-chain'],
    ),
    Expert(
      id: 'ma-may-thazin',
      name: 'Ma May Thazin',
      role: 'Regulatory advisor',
      description:
          'Helps a plant read a government notice and turn it into a list of records and dates.',
      phone: '09 250 880 404',
      email: 'may.thazin@fooddoctor.example',
      social: 'facebook.com/fooddoctor.example',
      articleIds: ['gov-notice'],
    ),
  ];

  static Expert? byId(String id) {
    for (final expert in experts) {
      if (expert.id == id) {
        return expert;
      }
    }
    return null;
  }
}
