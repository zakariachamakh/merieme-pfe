import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:office_furniture_store/src/model/furniture.dart';
import 'package:office_furniture_store/src/model/bottom_navigation_item.dart';

class AppData {
  const AppData._();

  static Future<List<Furniture>> getFurnitureList() async {
    final box = GetStorage();
    final jwt = box.read('jwt');
    List<Furniture> product = [];
    final response = await http.get(
      Uri.parse(
          'https://emsi-64tat.ondigitalocean.app/api/products?populate=*'),
      headers: {
        'Authorization': 'Bearer $jwt',
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final products =
          (jsonResponse['data'] as List<dynamic>).map((productJson) {
        final imagesJson =
            productJson['attributes']['images']['data'] as List<dynamic>;
        final images = imagesJson
            .map((imageJson) =>
                "https://emsi-64tat.ondigitalocean.app${imageJson['attributes']['url']}")
            .toList();
        product.add(Furniture(
          id: productJson['id'],
          quantity: 0,
          isFavorite: false,
          title: productJson['attributes']['title'],
          description: productJson['attributes']['description'],
          price: productJson['attributes']['price'].toDouble(),
          score: productJson['attributes']['score'].toDouble(),
          images: images,
        ));
      });
      print(products);
      return product;
    } else {
      return product;
    }
  }

  static List<BottomNavigationItem> bottomNavigationItems = [
    const BottomNavigationItem(Icon(Icons.home), 'Home'),
    const BottomNavigationItem(
        Icon(Icons.add_shopping_cart_rounded), 'Shopping cart'),
    const BottomNavigationItem(Icon(Icons.bookmark), 'Favorite'),
    const BottomNavigationItem(Icon(Icons.person), 'Profile')
  ];
}
