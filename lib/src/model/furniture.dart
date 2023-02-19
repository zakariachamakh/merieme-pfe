import 'package:office_furniture_store/src/model/furniture_color.dart';

class Furniture {
  int id;
  String title;
  String description;
  double price;
  int quantity;
  double score;
  List<String> images;
  bool isFavorite;

  Furniture({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 1,
    required this.score,
    required this.images,
    this.isFavorite = false,
  });
}
