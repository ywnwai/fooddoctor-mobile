import 'package:flutter/material.dart';

abstract final class AppShadows {
  static const card = <BoxShadow>[
    BoxShadow(color: Color(0x121A1408), blurRadius: 18, offset: Offset(0, 8)),
    BoxShadow(color: Color(0x0A000000), blurRadius: 2, offset: Offset(0, 1)),
  ];
}
