// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import '../services/mock.dart';

class Book {
  final String author;
  final String title;
  final String introduction;
  final String imageUrl;
  final String uid;


  Book(
      {required this.author,
      required this.title,
      required this.introduction,
      required this.imageUrl,
      required this.uid});

  Book copyWith({
    String? author,
    String? title,
    String? introduction,
    String? imageUrl,
    String? uid,
  }) {
    return Book(
      author: author ?? this.author,
      title: title ?? this.title,
      introduction: introduction ?? this.introduction,
      imageUrl: imageUrl ?? this.imageUrl,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'title': title,
      'introduction': introduction,
      'imageUrl': imageUrl,
      'uid': uid,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      author: map['author'] as String,
      title: map['title'] as String,
      introduction: map['introduction'] as String,
      imageUrl: map['imageUrl'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);

  static Book createMockBook() {
    return Book(
      author: Mock.author(),
      title: Mock.title(),
      introduction: Mock.introduction(),
      imageUrl: Mock.imageUrl(),
      uid: Mock.uid(),
    );
  }

  @override
  String toString() {
    return 'Book(author: $author, title: $title, introduction: $introduction, imageUrl: $imageUrl, uid: $uid)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.author == author &&
        other.title == title &&
        other.introduction == introduction &&
        other.imageUrl == imageUrl &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return author.hashCode ^
        title.hashCode ^
        introduction.hashCode ^
        imageUrl.hashCode ^
        uid.hashCode;
  }
}
