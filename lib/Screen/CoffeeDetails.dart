import 'package:coffee_shop/Utils/CtmColor.dart';
import 'package:coffee_shop/Widget/CustomStyle.dart';
import 'package:coffee_shop/Widget/Text.dart';
import 'package:flutter/material.dart';
import '../Model/CoffeePojo.dart';
import '../Widget/CoffeeTile.dart';
import '../Widget/ImageTile.dart';
import 'HomeScreen.dart';

class CoffeeDetails extends StatefulWidget {
  final CoffeePojo coffeePojo;

  const CoffeeDetails({super.key, required this.coffeePojo});

  @override
  State<CoffeeDetails> createState() => CoffeeDetailsState();
}

int activeIndex = 2;

class CoffeeDetailsState extends State<CoffeeDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(widget.coffeePojo.img, fit: BoxFit.cover),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                  stops: const [0.0, 0.08, 0.15, 1.0],
                  colors: [
                    Colors.orange.withValues(alpha: 0.5), // transparent orange
                    Colors.orange.withValues(alpha: 0.45),
                    Colors.transparent,
                    Colors.black87,
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                    ],
                  ),
                  Text(
                    "Details",
                    textAlign: TextAlign.center,
                    style: customStyle().copyWith(fontSize: 21),
                  ),
                ],
              ),
            ),

            Positioned(
              top: 55,
              left: 0,
              right: 0,
              child: Divider(height: 2, thickness: 1, color: Colors.white),
            ),

            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.1,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 120,
                      child: ListView.builder(
                        itemCount: coffeeList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ImageTile(coffeePojo: coffeeList[index]);
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: index == activeIndex ? 50 : 15,
                        height: 15,

                        decoration: BoxDecoration(
                          color: index == activeIndex
                              ? Colors.orange
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  Text(
                    widget.coffeePojo.name,
                    style: customStyle().copyWith(
                      fontSize: 21,
                      color: CtmColor.orange,
                    ),
                  ),
                  SizedBox(height: 2),
                  CustomFontText(txt: widget.coffeePojo.desc),

                  SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: CtmColor.orange),
                      SizedBox(width: 5),
                      Text(
                        widget.coffeePojo.rating,
                        style: customStyle().copyWith(fontSize: 21),
                      ),

                      SizedBox(width: 80),

                      Text(
                        "\$",
                        style: customStyle().copyWith(
                          fontSize: 21,
                          color: CtmColor.orange,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.coffeePojo.price,
                        style: customStyle().copyWith(fontSize: 21),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text("Add to cart", style: customStyle()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
