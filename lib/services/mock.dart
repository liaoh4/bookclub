import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:uuid/v4.dart';
import 'dart:math' as math;


const List<String> _coverImages = [
    'assets/images/cover1.jpg',
    'assets/images/cover2.jpg',
    'assets/images/cover3.jpg',
    'assets/images/cover4.jpg',
    'assets/images/cover5.jpg',
    'assets/images/cover6.jpg',
    'assets/images/cover7.jpg',
    'assets/images/cover8.jpg',
  ];

class Mock {
  static String author() {
    return lorem(paragraphs: 1, words: 1).replaceAll(".", "");
  }

  static String title() {
    return lorem(paragraphs: 1, words: 1).replaceAll(".", "");
  }

  static String introduction() {
    return "${title()} is written by ${author()} in 1990\n"
    "It is a 1936 novel writte by "
    "Margaret Mitchell and a 1939 film adaptation starring Vivien "
    "Leigh and Clark Gable. The novel is a sweeping epic "
    "romance set in the American South during and after the Civil "
    "War, focusing on the life of Scarlett O'Hara and her relation"
    "ships with Ashley Wilkes and Rhett Butler. The film adaptation is a highly "
    "acclaimed and popular movie that brought the story to a wider audience. ";
  }

  static String uid() {
    return UuidV4().generate();
  }
  static final math.Random _random = math.Random();

  static String imageUrl({String? author, String? title}) {
    String randomCover = _coverImages[_random.nextInt(_coverImages.length)];
    return randomCover;
   
  }
}
