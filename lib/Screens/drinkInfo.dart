import 'package:cocktaildb/Components/drink_additional_info.dart';
import 'package:flutter/material.dart';
import 'package:cocktaildb/Components/drinks_list.dart';

class DrinkInfo extends StatelessWidget {
  final int drinkIndex;
  DrinkInfo({this.drinkIndex});

  final Drinks d = Drinks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        color: Color(0xFF282741),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${d.drinks[drinkIndex]['strDrink']}',
                    style: TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(
                            d.drinks[drinkIndex]['strDrinkThumb'],
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Text(
                      'Ingredients',
                      style: TextStyle(color: Color(0xFFD4AF37), fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: IngredientRowWidget(drinkIndex: drinkIndex)
                          .dbWidgetGet(),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Directions',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    d.drinks[drinkIndex]['strInstructions'],
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
