import 'package:flutter/material.dart';
import 'package:groupchat/library/widgets/reading_book.dart';

import 'book_cover_3d.dart';

class LastOpenedBook extends StatelessWidget {
  const LastOpenedBook({Key? key}) : super(key: key);

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
            "Last Opened ⏳",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReadingBook(
                          pdfPath: "assets/book0.pdf",
                        )),
              );
            },
            child: BookCover3D(
              imageUrl:
                  "https://m.media-amazon.com/images/I/61RFleAKgqL.AC_UY327_FMwebp_QL65.jpg",
            ),
          ),
        ),
      ],
    );
  }
}
