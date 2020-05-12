import 'package:flutter/material.dart';
import 'package:nyankomobile/nyanko/search.dart';
import 'nyanko/nyanko.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static final Nyanko nyanko = Nyanko();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SearchEntry> searchResults = [];
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(leading: Icon(Icons.search), title: Text("Search")),
            ListTile(leading: Icon(Icons.account_box), title: Text("Accounts"))
          ],
        )
      ),
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search",
          ),
          onChanged: (text) {
            setState(() {
              query = text;
            });
          },
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {
            setState(() {
              searchResults = MyHomePage.nyanko.search(query);
            });
          })
        ]
      ),
      body: ListView.builder(
          itemCount: searchResults.length,
          itemBuilder: (_, i) {
            return Card(
              elevation: 5,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: FittedBox(
                      child: Image.network(searchResults[i].image),
                      fit: BoxFit.cover,
                    )
                  ),
                  SizedBox(width: 10),
                  Flexible(child: Text(searchResults[i].title)),
                ],
              )
            );
          }
      )
    );
  }
}

