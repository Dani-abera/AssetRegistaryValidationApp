import 'package:flutter/material.dart';
import 'package:food_delivery/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController controller;
  const MyTabBar({super.key, required this.controller});

  List<Tab> _buildCategoryTabs() {
    return AssetCategoryd.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(controller: controller, tabs: _buildCategoryTabs()),
    );
  }
}
