import 'package:cocktaildb/Screens/drinkHome.dart';
import 'package:cocktaildb/Screens/drinkInfo.dart';
import 'package:flutter/material.dart';
import 'package:cocktaildb/Components/drinks_list.dart';

class PageBuild extends StatelessWidget {
  final int drinkIndex;
  PageBuild({this.drinkIndex});

  final Drinks d = new Drinks();
  final controller = PageController();

  static String id = 'test';
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: [
        DrinkHome(
          drinkIndex: drinkIndex,
        ),
        DrinkInfo(
          drinkIndex: drinkIndex,
        ),
      ],
    );
  }
}
