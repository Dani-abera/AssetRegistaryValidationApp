import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_current_location.dart';
import 'package:food_delivery/components/my_description_box.dart';
import 'package:food_delivery/components/my_food_tile.dart';
import 'package:food_delivery/components/my_sliver_appbar.dart';
import 'package:food_delivery/components/my_tab_bar.dart';
import 'package:food_delivery/models/food.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../models/restaurant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        TabController(length: AssetCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Assetd> _filterFoodMenuByCatagory(
      AssetCategory category, List<Assetd> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCatagory(List<Assetd> fullMenu) {
    return AssetCategory.values.map((catagory) {
      List<Assetd> catagotyMenu = _filterFoodMenuByCatagory(catagory, fullMenu);

      return ListView.builder(
        itemCount: catagotyMenu.length,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = catagotyMenu[index];
          return MyFoodTile(food: food);
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MySliverAppbar(
                  title: MyTabBar(controller: _controller),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      MyCurrentLocation(),
                      MyDescriptionBox(),
                    ],
                  ),
                ),
              ],
          body: Consumer<AssetRegistry>(
              builder: (context, restaurant, child) => TabBarView(
                  controller: _controller,
                  children: getFoodInThisCatagory(restaurant.assets)))),
    );
  }
}
