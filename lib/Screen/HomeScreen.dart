import 'package:coffee_shop/Model/CoffeePojo.dart';
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
int active = 0;

List coffeeType = [
  "Cappuccino",
  "Latte",
  "Espresso",
  "Americano",
  "Mocha",
  "Macchiato",
];

List<CoffeePojo> coffeeList = [
  CoffeePojo(
    name: "Cappuccino",
    desc: "Rich espresso blended with creamy milk.",
    price: "4.50",
    rating: "4.8",
    img: "assets/images/cup6.png",
  ),
  CoffeePojo(
    name: "Latte",
    desc: "Smooth and aromatic coffee with a velvety finish.",
    price: "5.00",
    rating: "4.7",
    img: "assets/images/cup2.png",
  ),
  CoffeePojo(
    name: "Espresso",
    desc: "Bold roasted beans with deep chocolate notes.",
    price: "3.50",
    rating: "4.9",
    img: "assets/images/cup3.png",
  ),
  CoffeePojo(
    name: "Americano",
    desc: "A refreshing cold brew with a naturally sweet taste.",
    price: "4.00",
    rating: "4.6",
    img: "assets/images/cup4.png",
  ),
  CoffeePojo(
    name: "Mocha",
    desc: "Perfectly balanced coffee for any time of day.",
    price: "5.50",
    rating: "4.8",
    img: "assets/images/cup5.jpg",
  ),
];

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
                    itemCount: coffeeType.length,
                    scrollDirection: Axis.horizontal,

                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          coffeeType[index],
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
                  child: ListView.builder(
                    itemCount: coffeeList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CoffeeDetails(coffeePojo: coffeeList[index]),
                            ),
                          );
                        },
                        child: CoffeeTile(coffeePojo: coffeeList[index]),
                      );
                      // return CoffeeDetails();
                    },
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
