import 'drinks_list.dart';
import 'package:flutter/material.dart';

class Info {
  final int drinkIndex;
  Info({this.drinkIndex});

  Drinks d = Drinks();
  var drinkIngredients = [];
  var drinkIngredientsMeasure = [];

  List getIngredient() {
    for (var i = 1; i <= 15; i++) {
      if (d.drinks[drinkIndex]['strIngredient$i'] != null) {
        drinkIngredients.add(d.drinks[drinkIndex]['strIngredient$i']);
      }
    }
    return drinkIngredients;
  }

  List getIngredientMeasure() {
    for (var i = 1; i <= 15; i++) {
      if (d.drinks[drinkIndex]['strIngredient$i'] != null) {
        if (d.drinks[drinkIndex]['strMeasure$i'] == null) {
          drinkIngredientsMeasure.add(" ");
        } else {
          drinkIngredientsMeasure.add(d.drinks[drinkIndex]['strMeasure$i']);
        }
      }
    }
    return drinkIngredientsMeasure;
  }
}

class IngredientRowWidget {
  final int drinkIndex;
  IngredientRowWidget({this.drinkIndex});
  List<Widget> dbWidgetGet() {
    List<Widget> columnChildren = [];
    var dI = Info(drinkIndex: drinkIndex).getIngredient();
    var dIM = Info(drinkIndex: drinkIndex).getIngredientMeasure();

    for (int i = 0; i < dI.length; i++) {
      columnChildren.add(
        Row(
          children: [
            Text(
              dI[i],
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Text(
              dIM[i],
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
      columnChildren.add(
        Divider(
          color: Colors.white,
          thickness: 1.0,
        ),
      );
    }

    return columnChildren;
  }
}
