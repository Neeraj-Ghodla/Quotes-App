import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotes_app/quote.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = Random().nextInt(3000);
  int quotesLength;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Quotes"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.bottomRight,
                end: FractionalOffset.topLeft,
                colors: [
                  Color(0x7b14a8).withOpacity(1.0),
                  Color(0xa85e14).withOpacity(1.0),
                ],
              ),
            ),
          ),
          FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString("assets/quotes.json"),
            builder: (context, snapshot) {
              var quotes = json.decode(snapshot.data.toString());
              if (quotes != null) {
                quotesLength = quotes.length;
              }
              return quotes != null ? ShowQuote(quotes, index) : Container();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            index = Random().nextInt(quotesLength);
          });
        },
      ),
    );
  }
}
