import 'package:flutter/material.dart';
import 'package:cocktaildb/Components/drinks_list.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class DrinkHome extends StatelessWidget {
  final int drinkIndex;
  DrinkHome({this.drinkIndex});

  final Drinks d = Drinks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.loose,
          overflow: Overflow.clip,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(d.drinks[drinkIndex]['strDrinkThumb']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: ColorizeAnimatedTextKit(
                          repeatForever: true,
                          onTap: () {
                            print("Tap Event");
                          },
                          text: ['${d.drinks[drinkIndex]['strDrink']}'],
                          textStyle: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold,
                          ),
                          colors: [
                            Colors.yellow,
                            Colors.white,
                            Colors.tealAccent,
                            Colors.blue,
                            Colors.red,
                          ],
                          textAlign: TextAlign.center,
                          alignment: AlignmentDirectional
                              .topStart // or Alignment.topLeft
                          ),
                    ),
                  ),
                  Container(
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
//Text(
//d.drinks[10]['strDrink'],
//style: TextStyle(color: Colors.purple, fontSize: 40),
//),
