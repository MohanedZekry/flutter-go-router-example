import 'package:flutter/cupertino.dart';

class NamedNavigationBarItemWidget extends BottomNavigationBarItem {
  final String initialLocation;

  NamedNavigationBarItemWidget({
    required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);

}
