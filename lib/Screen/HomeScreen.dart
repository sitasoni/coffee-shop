import 'package:coffee_shop/Screen/CoffeeDetails.dart';
import 'package:flutter/material.dart';
import '../Widget/CustomDrawer.dart';
import '../Widget/CoffeeTile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

final scaffoldKey = GlobalKey<ScaffoldState>();

List coffeeList = [
  "Cappuccino",
  "Latte",
  "Espresso",
  "Americano",
  "Mocha",
  "Macchiato",
];

List coffeeDescriptionList = [
  "Rich espresso blended with creamy milk.",
  "Smooth and aromatic coffee with a velvety finish.",
  "Bold roasted beans with deep chocolate notes.",
  "A refreshing cold brew with a naturally sweet taste.",
  "Perfectly balanced coffee for any time of day.",
  "Creamy cappuccino topped with frothy milk foam.",
  "Strong and intense flavor for coffee lovers.",
  "Light roast with fruity and floral undertones.",
  "Warm and comforting coffee with a silky texture.",
  "Premium handcrafted coffee made from selected beans.",
];

int active = 0;

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        key: scaffoldKey,
        drawer: Drawer(
          // width: MediaQuery.of(context).size.width * 0.5,
          child: CustomDrawer(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey.withValues(alpha: 0.3),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.orange),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.white),
              label: "favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              label: "Card",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white),
              label: "Account",
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Scaffold.of(context).openDrawer();
                          scaffoldKey.currentState?.openDrawer();
                        },
                        child: Icon(
                          Icons.apps,
                          size: 25,
                          color: Colors.grey.withValues(alpha: 0.9),
                        ),
                      ),
                    ),
                    ClipOval(
                      child: Image.asset(
                        "assets/images/coffee3.png",
                        width: 45,
                        height: 45,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Text(
                  "Find the Best \nCoffee for You.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),

                SizedBox(height: 25),

                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white.withValues(alpha: 0.8),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search Your Favorite...",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 25),

                SizedBox(
                  height: 40,
                  width: double.maxFinite,
                  child: ListView.builder(
                    itemCount: coffeeList.length,
                    scrollDirection: Axis.horizontal,

                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          coffeeList[index],
                          style: TextStyle(
                            fontSize: 15,
                            color: index == active
                                ? Colors.orange
                                : Colors.grey.withValues(alpha: 0.8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 10),

                SizedBox(
                  height: 230,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CoffeeDetails()));
                    },
                    child: ListView.builder(
                      itemCount: coffeeList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CoffeeTile(idx: index);
                        // return CoffeeDetails();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
