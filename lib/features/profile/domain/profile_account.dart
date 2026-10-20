import 'package:flutter/foundation.dart';

/// Editable account fields for this session.
class ProfileAccount extends ChangeNotifier {
  ProfileAccount({
    this.name = 'U Mg Mg',
    this.telephone = '09 250 000 000',
    this.email = 'alex.rivera@example.com',
    this.address = 'Yangon',
    this.business = 'River Bake House',
    this.position = 'Owner',
    this.type = 'Bakery & confectionery',
    this.product = 'Bread and cakes',
    this.size = '11-50 employees',
  });

  String name;
  String telephone;
  String email;
  String address;
  String business;
  String position;
  String type;
  String product;
  String size;

  void update({
    required String name,
    required String telephone,
    required String email,
    required String address,
    required String business,
    required String position,
    required String type,
    required String product,
    required String size,
  }) {
    this.name = name;
    this.telephone = telephone;
    this.email = email;
    this.address = address;
    this.business = business;
    this.position = position;
    this.type = type;
    this.product = product;
    this.size = size;
    notifyListeners();
  }
}
