import '../../model/book.dart';

enum SortType { none, author, title }

abstract class BookListState {}

class BookListLoading extends BookListState {}

class BookListLoaded extends BookListState {
  final List<Book> books;
  final SortType sortType;
  BookListLoaded(this.books, {this.sortType = SortType.none});
}
