import '../../model/book.dart';
abstract class BookListState {}

class BookListLoading extends BookListState {}

class BookListLoaded extends BookListState {
  final List<Book> books;
  BookListLoaded(this.books);
}
