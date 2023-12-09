import 'package:flutter/material.dart';

/// A utility class for managing API URLs related to fruits.

class Urls {
  /// Base URL for the Fruit API.
  static const String fruitAPIBaseURL = "https://www.fruityvice.com/api/fruit";

  /// Generates the URL for fetching fruit information by name.
  ///
  /// Example:
  /// ```dart
  /// String url = Urls.fruitInfoByName('apple');
  /// ```
  static String fruitInfoByName(String name) => '$fruitAPIBaseURL/$name';
}

/// A utility class for managing the color scheme of the app.

class AppColors {
  /// Primary color for lines and text.
  static const Color primaryLineColor = Color(0xff1C031F);

  /// Primary background color of the app.
  static const Color primaryBackgroundColor = Color(0xffFFBE8F);

}

/// A utility class for managing lists of fruit images and names.

class FruitSelectionList {
  /// Returns a list of URLs for fruit images.
  ///
  /// Example:
  /// ```dart
  /// List<String> imageUrls = FruitSelectionList.fruitImgUrlList();
  /// ```
  static List fruitImgUrlList() {
    return [
      // ... image URLs ...
      "assets/images/fruits/persimmon.png",
      "assets/images/fruits/strawberry.png",
      "assets/images/fruits/banana.png",
      "assets/images/fruits/tomato.png",
      "assets/images/fruits/pear.png",
      "assets/images/fruits/durian.png",
      "assets/images/fruits/blackberry.png",
      "assets/images/fruits/lingonberry.png",
      "assets/images/fruits/kiwi.png",
      "assets/images/fruits/lychee.png",
      "assets/images/fruits/pineapple.png",
      "assets/images/fruits/fig.png",
      "assets/images/fruits/gooseberry.png",
      "assets/images/fruits/passionfruit.png",
      "assets/images/fruits/plum.png",
      "assets/images/fruits/orange.png",
      "assets/images/fruits/green apple.png",
      "assets/images/fruits/raspberry.png",
      "assets/images/fruits/watermelon.png",
      "assets/images/fruits/lemon.png",
      "assets/images/fruits/mango.png",
      "assets/images/fruits/blueberry.png",
      "assets/images/fruits/apple.png",
      "assets/images/fruits/guava.png",
      "assets/images/fruits/apricot.png",
      "assets/images/fruits/papaya.png",
      "assets/images/fruits/melon.png",
      "assets/images/fruits/tangerine.png",
      "assets/images/fruits/pitahaya.png",
      "assets/images/fruits/lime.png",
      "assets/images/fruits/pomegranate.png",
      "assets/images/fruits/dragonfruit.png",
      "assets/images/fruits/grape.png",
      "assets/images/fruits/morus.png",
      "assets/images/fruits/feijoa.png",
      "assets/images/fruits/avocado.png",
      "assets/images/fruits/kiwifruit.png",
      "assets/images/fruits/cranberry.png",
      "assets/images/fruits/cherry.png",
      "assets/images/fruits/peach.png",
      "assets/images/fruits/jackfruit.png",
      "assets/images/fruits/horned melon.png",
      "assets/images/fruits/hazelnut.png",
      "assets/images/fruits/pomelo.png",
      "assets/images/fruits/mangosteen.png",
    ];
  }

  static List fruitNameList() {
    /// Returns a list of fruit names.
    ///
    /// Example:
    /// ```dart
    /// List<String> names = FruitSelectionList.fruitNameList();
    /// ```
    return [
      // ... fruit names ...
      "persimmon",
      "strawberry",
      "banana",
      "tomato",
      "pear",
      "durian",
      "blackberry",
      "lingonberry",
      "kiwi",
      "lychee",
      "pineapple",
      "fig",
      "gooseberry",
      "passionfruit",
      "plum",
      "orange",
      "greenapple",
      "raspberry",
      "watermelon",
      "lemon",
      "mango",
      "blueberry",
      "apple",
      "guava",
      "apricot",
      "papaya",
      "melon",
      "tangerine",
      "pitahaya",
      "lime",
      "pomegranate",
      "dragonfruit",
      "grape",
      "morus",
      "feijoa",
      "avocado",
      "kiwifruit",
      "cranberry",
      "cherry",
      "peach",
      "jackfruit",
      "horned melon",
      "hazelnut",
      "pomelo",
      "mangosteen",
    ];
  }
}
