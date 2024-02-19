import 'package:flutter/material.dart';
import 'package:groupchat/library/screens/home/sections/all_purchased_books.dart';
import 'package:groupchat/library/widgets/keep_reading_section.dart';
import 'package:groupchat/library/widgets/last_opened_book.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 200, 207, 212),
        title: Text(
          "Your Dashboard 📰",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              LastOpenedBook(),
              KeepReadingSection(),
              AllPurchasedBooks(),
            ],
          ),
        ),
      ),
    );
  }
}
