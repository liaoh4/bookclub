import 'package:flutter/material.dart';

import '../model/book.dart';

class BookCover extends StatelessWidget {
  const BookCover({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:110,
      child: Row(
        children:[
        Image.asset(
        book.imageUrl,
        width:75,
        height:100,
        fit:BoxFit.cover,
      ),
      ]
      ),
    );
  }
}