import 'package:flutter/material.dart';

class ShowQuote extends StatelessWidget {
  final int index;
  final List quotes;

  ShowQuote(this.quotes, this.index);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: displayQuote(quotes),
    );
  }

  Widget displayQuote(quotes) {
    return Container(
      height: 400,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "${quotes[index]['quoteText']}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.0),
          ),
          Text(
            "${quotes[index]['quoteAuthor']}",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
