import 'package:flutter/material.dart';
import 'search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SearchPage(AppDrawer()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(leading: Icon(Icons.search), title: Text("Search")),
            ListTile(leading: Icon(Icons.account_box), title: Text("Accounts"))
          ],
        )
    );
  }
}

