import 'package:coffee_shop/Model/CoffeePojo.dart';
import 'package:coffee_shop/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'Text.dart';

class CoffeeTile extends StatefulWidget {
  final CoffeePojo coffeePojo;

  const CoffeeTile({
  super.key,
  required this.coffeePojo,
  });

  @override
  State<StatefulWidget> createState() => TileState();
}

class TileState extends State<CoffeeTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.coffeePojo.img),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 15),
                        SizedBox(width: 5),
                        Text(
                          widget.coffeePojo.rating,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 5),

            CustomText(txt: widget.coffeePojo.name),
            CustomFontText(
              txt: widget.coffeePojo.desc,
              size: 10,
              color: Colors.white.withValues(alpha: 0.7),
            ),

            Row(
              children: [
                CustomText(txt: "\$", color: Colors.orange),
                SizedBox(width: 2),
                CustomText(txt: widget.coffeePojo.price),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.add, color: Colors.white,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
