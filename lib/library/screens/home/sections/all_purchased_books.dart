import 'package:flutter/material.dart';
import '../../../api/generated_books.dart';
import '../../../models/books.dart';
import '../../../widgets/book_cover_3d.dart';
import '../../../widgets/reading_book.dart';

class AllPurchasedBooks extends StatelessWidget {
  const AllPurchasedBooks({Key? key}) : super(key: key);

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
    "languages 🔠",
    style: Theme.of(context).textTheme.titleSmall,
  ),
),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _buildPurchasedBookList(context),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildPurchasedBookList(BuildContext context) {
    final List<Book> books = getAllBooks();

    return books.skip(10).take(5).map((book) {
      return Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReadingBook(
                    pdfPath:
                        book.pdfPath // Use the pdfPath from the book object
                    ),
              ),
            );
          },
          child: BookCover3D(imageUrl: book.imageUrl),
        ),
      );
    }).toList();
  }
}
