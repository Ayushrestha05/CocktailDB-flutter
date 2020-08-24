import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cocktaildb/Components/drinks_list.dart';
import 'package:cocktaildb/Components/griditem_build.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class GridScreen extends StatelessWidget {
  static String id = 'grid_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CocktailDB'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('CocktailDB'),
              decoration: BoxDecoration(color: Color(0xFF77B86E)),
            ),
            ListTile(
              title: Text('Created by Ayush Shrestha'),
              trailing: RawMaterialButton(
                child: Icon(AntDesign.github),
                onPressed: () {
                  _launchURL('https://github.com/Ayushrestha05');
                },
              ),
            ),
            ListTile(
              title: Text(
                  'Thanks to TheDataDB team for providing the Cocktail Database'),
              trailing: RawMaterialButton(
                child: Icon(Foundation.web),
                onPressed: () {
                  _launchURL('https://www.thecocktaildb.com/');
                },
              ),
            ),
            ListTile(
              title: Text(
                  'Thanks to Lauri Harpf for making the database downloadable'),
              trailing: RawMaterialButton(
                  child: Icon(AntDesign.github),
                  onPressed: () {
                    _launchURL('https://github.com/lauriharpf');
                  }),
            ),
            ListTile(
              title: Text("Created using Flutter"),
            ),
          ],
        ),
      ),
      body: TwoGrid(),
    );
  }
}

class TwoGrid extends StatefulWidget {
  @override
  _TwoGridState createState() => _TwoGridState();
}

class _TwoGridState extends State<TwoGrid> {
  Drinks d = Drinks();

  List<Widget> getDrinkGridList() {
    List<Widget> list = [];
    for (int i = 0; i < d.drinks.length; i++) {
      list.add(GridDrinkLayout(
        drinkIndex: i,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(left: 10, right: 10),
          sliver: SliverGrid.count(
            mainAxisSpacing: 10, //horizontal line spacing among children
            crossAxisSpacing: 10, //vertical line spacing among children
            childAspectRatio: 0.7, //determines the size of grid in the layout
            crossAxisCount: 2,
            children: getDrinkGridList(),
          ),
        )
      ],
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: false);
  } else {
    print('Could not launch $url');
  }
}
