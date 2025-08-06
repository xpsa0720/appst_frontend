import 'package:appst/common/default_tab.dart';
import 'package:flutter/material.dart';

class DumyScreen extends StatelessWidget {
  static String get routeFullPath => '/dumy';
  static String get routePath => 'dumy';
  const DumyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTab(child: Text('레전드 네버 다이!!!!!!!!!!!!!!'));
  }
}
