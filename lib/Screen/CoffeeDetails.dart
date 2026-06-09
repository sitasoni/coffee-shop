import 'package:coffee_shop/Screen/HomeScreen.dart';
import 'package:coffee_shop/Utils/CtmColor.dart';
import 'package:coffee_shop/Widget/CustomStyle.dart';
import 'package:coffee_shop/Widget/Text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CoffeeDetails extends StatefulWidget {
  const CoffeeDetails({super.key});

  @override
  State<CoffeeDetails> createState() => _CoffeeDetailsState();
}

int activeIndex = 2;

class _CoffeeDetailsState extends State<CoffeeDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    "Details",
                    textAlign: TextAlign.center,
                    style: customStyle().copyWith(fontSize: 21),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: Image.asset(
                      "assets/images/cup2.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                          Colors.black87,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: [
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
                                borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          coffeeList[0],
                          style: customStyle().copyWith(
                            fontSize: 21,
                            color: CtmColor.orange,
                          ),
                        ),
                        SizedBox(height: 2),
                        CustomFontText(txt: coffeeDescriptionList[0]),

                        SizedBox(height: 5),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: CtmColor.orange),
                            SizedBox(width: 5),
                            Text(
                              "4.5",
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
                              "420",
                              style: customStyle().copyWith(fontSize: 21),
                            ),
                          ],
                        ),

                        SizedBox(height: 10),

                        SizedBox(
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
                      ],
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
