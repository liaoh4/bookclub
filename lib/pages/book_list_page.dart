import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_detail_page.dart';
import '../widgets/book_cover.dart';
import 'booklist/book_list_cubit.dart';
import 'booklist/book_list_state.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Book Club Home",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Buttons
            BlocBuilder<BookListCubit, BookListState>(
              builder: (context, state) {
                SortType currentSort = SortType.none;
                if (state is BookListLoaded) {
                  currentSort = state.sortType;
                }
                return Row(
                  children: [
                    const Text("Sort by", style: TextStyle(fontSize: 18)),
                    const SizedBox(width: 10),
                    FilledButton(
                      onPressed: () {
                        context.read<BookListCubit>().sortByAuthor();
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor:
                            currentSort == SortType.author
                                ? const Color.fromRGBO(231, 185, 211, 1)
                                : Colors.white, 
                        foregroundColor:Colors.black,
                        side: const BorderSide(color: Colors.grey),
                      ),
                      child: const Text('Author'),
                    ),
                    const SizedBox(width: 10),
                    FilledButton(
                      onPressed: () {
                        context.read<BookListCubit>().sortByTitle();
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor:
                            currentSort == SortType.title
                                ? const Color.fromRGBO(231, 185, 211, 1)
                                : Colors.white, // 
                         foregroundColor:Colors.black,
                        side: const BorderSide(color: Colors.grey),
                      ),
                      child: const Text('Title'),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 16),
            const Text("Books", style: TextStyle(fontSize: 28)),
            const SizedBox(height: 16),

            // Book List
            BlocBuilder<BookListCubit, BookListState>(
              builder: (context, state) {
                if (state is BookListLoading) {
                  return _buildShimmerList(); //  animation
                } else if (state is BookListLoaded) {
                  final bookList = state.books;
                  if (bookList.isEmpty) {
                    return const Center(child: Text('No books available'));
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...bookList.expand(
                          (book) => [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => BookDetailPage(book: book),
                                  ),
                                );
                              },
                              child: BookCover(
                                //key: ValueKey(book.uid),
                                book: book,
                              ),
                            ),
                            const SizedBox(width: 15),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox(); // in case there is no returning Widget
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  //shimmer loading
  Widget _buildShimmerList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 80,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
