import 'package:flutter/material.dart';

import '../model/book.dart';




class BookDetailPage extends StatelessWidget {
  final Book book;
  
  //BookDetailPage({Key?key, Book? book})
    //  : book = book ?? Book.createMockBook(),
      //super(key: key);
  const BookDetailPage({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
   

  
    return Scaffold(
      appBar: AppBar( 
        centerTitle: true,
        title: Text("Book Detail",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        )),
        ),

      body: Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 封面和文字顶部对齐
        children: [
          // coverImage
          Image.asset(
            book.imageUrl, 
            width: 270,
            height: 360,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16), // 封面和文字之间的间距
          
          // details of the book
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'by ${book.author}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  book.introduction,
                  maxLines: 10, 
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    )
    );
            
      
  }
}