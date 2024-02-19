import 'package:flutter/material.dart';
import 'package:groupchat/library/screens/market/suggestions/discount_books.dart';
import 'package:groupchat/library/screens/market/suggestions/popular_books.dart';
import 'package:groupchat/library/screens/market/suggestions/trend_books.dart';

import 'filters/search_bar.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 200, 207, 212),
        title: Text(
          "Your next book 📚",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 0),
              SizedBox(height: 24),
              TrendBooks(),
              SizedBox(height: 24),
              PopularBooks(),
              SizedBox(height: 24),
              DiscountBooks(),
            ],
          ),
        ),
      ),
    );
  }
}
