import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false});

  void setFavoriteValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  void toggleFavoriteStatus() async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = "https://shop-app-b1120.firebaseio.com/products/$id.json";
    try {
      var response =
          await http.patch(url, body: json.encode({'isFavorite': isFavorite}));
      if (response.statusCode >= 400) {
        setFavoriteValue(oldStatus);
      }
    } catch (error) {
      setFavoriteValue(oldStatus);
    }
  }
}
