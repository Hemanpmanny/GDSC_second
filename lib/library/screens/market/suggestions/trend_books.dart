import 'package:flutter/material.dart';
import '../../../api/generated_books.dart';
import '../../../models/books.dart';
import '../../../widgets/buy_book_wrapper.dart';

class TrendBooks extends StatelessWidget {
  const TrendBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
  decoration: BoxDecoration(
    // border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.circular(20),
    color: Color.fromARGB(255, 201, 199, 199),
  ),
  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  child: Text(
    "Science 🔬",
    style: Theme.of(context).textTheme.titleSmall,
  ),
),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _buildTrendBookList(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildTrendBookList() {
    List<Book> books = getAllBooks();

    return books.take(4).map((book) {
      return Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: BuyBookWrappper(book: book),
      );
    }).toList();
  }
}
