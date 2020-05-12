import 'package:flutter/material.dart';
import 'package:nyankomobile/main.dart';
import 'nyanko/nyanko.dart';
import 'nyanko/search.dart';

class SearchPage extends StatefulWidget {
  static final Nyanko nyanko = Nyanko();
  final AppDrawer drawer;

  SearchPage(this.drawer);

  @override
  _SearchPageState createState() => _SearchPageState(drawer);
}

class _SearchPageState extends State<SearchPage> {
  final AppDrawer drawer;
  List<SearchEntry> searchResults = [];
  String query = "";

  _SearchPageState(this.drawer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer,
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
                  searchResults = SearchPage.nyanko.search(query);
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

