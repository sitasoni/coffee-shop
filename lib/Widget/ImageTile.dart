import 'package:coffee_shop/Model/CoffeePojo.dart';
import 'package:coffee_shop/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'Text.dart';

class ImageTile extends StatefulWidget {
  final CoffeePojo coffeePojo;

  const ImageTile({
  super.key,
  required this.coffeePojo,
  });

  @override
  State<StatefulWidget> createState() => TileState();
}

class TileState extends State<ImageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // width: ,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.coffeePojo.img),
                  fit: BoxFit.cover,
                ),
                color: Colors.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
