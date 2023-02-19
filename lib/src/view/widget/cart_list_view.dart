import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/app_style.dart';
import 'package:office_furniture_store/core/app_extension.dart';
import 'package:office_furniture_store/src/model/furniture.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    Key? key,
    required this.counterButton,
    required this.furnitureItems,
  }) : super(key: key);

  final Widget Function(Furniture furniture) counterButton;
  final List<Furniture> furnitureItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: furnitureItems.length,
      itemBuilder: (_, index) {
        Furniture furniture = furnitureItems[index];
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(furniture.images[0]),
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(furniture.title.addOverFlow, style: h4Style),
                  const SizedBox(height: 5),
                  Text("\$${furniture.price}", style: h2Style),
                  const SizedBox(height: 5),
                ],
              ),
              // Spacer(),
              counterButton(furniture)
            ],
          ).fadeAnimation(0.4 * index),
        );
      },
      separatorBuilder: (_, __) {
        return const Padding(padding: EdgeInsets.only(bottom: 15));
      },
    );
  }
}
