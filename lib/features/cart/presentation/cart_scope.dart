import 'package:flutter/widgets.dart';
import 'package:food_doctor/features/cart/domain/selection_cart.dart';

class CartScope extends InheritedNotifier<SelectionCart> {
  const CartScope({super.key, required SelectionCart cart, required super.child})
    : super(notifier: cart);

  static SelectionCart of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<CartScope>();
    assert(scope != null, 'CartScope is missing above this widget.');
    return scope!.notifier!;
  }
}
