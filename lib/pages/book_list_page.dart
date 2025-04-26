import 'package:flutter/material.dart';
import '../model/book.dart';  // 记得改成你的实际路径
import 'book_detail_page.dart';  // 记得改成你的实际路径
import '../widgets/book_cover.dart'; // 记得改成你的实际路径

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Book> bookList = List.generate(4, (index) {
      return Book.createMockBook();
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Book Club Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Buttons
            Row(
              children: [
                const Text("Sort by", style: TextStyle(fontSize: 18)),
                const SizedBox(width: 10),
                FilledButton(
                  onPressed: () {
                    print('Sort by Author');
                  },
                  child: const Text('Author'),
                ),
                const SizedBox(width: 10),
                FilledButton(
                  onPressed: () {
                    print('Sort by Title');
                  },
                  child: const Text('Title'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text("Books", style: TextStyle(fontSize: 28)),
            const SizedBox(height: 16),

            // Book List
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...bookList.expand((book) => [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailPage(book: book),
                          ),
                        );
                      },
                      child: BookCover(book: book),
                    ),
                    const SizedBox(width: 15), // space between books
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
