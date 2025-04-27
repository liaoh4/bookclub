import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/book.dart';
import 'book_list_state.dart';

class BookListCubit extends Cubit<BookListState> {
  BookListCubit() : super(BookListLoading()) {
    _loadBooks();
  }

  void _loadBooks() {
    final books = List.generate(4, (_) => Book.createMockBook());
    emit(BookListLoaded(books));
  }

  void sortByAuthor() {
    final currentState = state;
    if (currentState is BookListLoaded) {
      emit(BookListLoading()); // show Loading
      final sortedList = List<Book>.from(currentState.books)
        ..sort((a, b) => a.author.compareTo(b.author));
      Future.delayed(const Duration(milliseconds: 300), () { //delay animation
        emit(BookListLoaded(sortedList,sortType: SortType.author));
      });
    }
  }

  void sortByTitle() {
    final currentState = state;
    if (currentState is BookListLoaded) {
      emit(BookListLoading());
      final sortedList = List<Book>.from(currentState.books)
        ..sort((a, b) => a.title.compareTo(b.title));
      Future.delayed(const Duration(milliseconds: 300), () {
        emit(BookListLoaded(sortedList,sortType: SortType.title));
      });
    }
  }
}
