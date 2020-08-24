import 'package:cocktaildb/Screens/page_view.dart';
import 'package:flutter/material.dart';
import 'drinks_list.dart';

class GridDrinkLayout extends StatelessWidget {
  final int drinkIndex;

  GridDrinkLayout({this.drinkIndex});
  final Drinks d = Drinks();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PageBuild(
                    drinkIndex: drinkIndex,
                  )),
        );
      },
      child: Container(
        height: 300,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(d.drinks[drinkIndex]['strDrinkThumb']),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.loose,
          alignment: AlignmentDirectional.bottomStart,
          overflow: Overflow.clip,
          children: [
            Container(
              child: Container(
                padding: EdgeInsets.all(7),
                //height: 40,
                width: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.zero,
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.zero),
                  color: Color(0xFF77B86E).withOpacity(0.8),
                ),
                child: Flex(direction: Axis.horizontal, children: [
                  Expanded(
                    child: Text(
                      d.drinks[drinkIndex]['strDrink'],
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
