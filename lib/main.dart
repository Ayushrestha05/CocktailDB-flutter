import 'package:cocktaildb/Screens/grid_screen.dart';
import 'package:cocktaildb/Screens/page_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFF77B86E)),
      initialRoute: GridScreen.id, //Initial Build Screen
      routes: {
        GridScreen.id: (context) => GridScreen(),
        PageBuild.id: (context) => PageBuild(),
      },
    );
  }
}
