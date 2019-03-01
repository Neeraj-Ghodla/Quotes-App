import 'package:flutter/material.dart';
import 'package:quotes_app/home.dart';

class FavPage extends StatelessWidget {
  final List<String> quotes;
  final List<String> authors;

  FavPage([this.quotes, this.authors]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text("Menu"),
            ),
            ListTile(
              title: Text("Quotes"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: Center(
        child: favList(),
      ),
    );
  }

  Widget favList() {
    return quotes != null
        ? Column(
            children: quotes
                .map(
                  (quote) => Card(
                        child: Column(
                          children: <Widget>[
                            Text(quote),
                            Text("${authors[0]}")
                          ],
                        ),
                      ),
                )
                .toList(),
          )
        : Container();
  }
}
