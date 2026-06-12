class CoffeePojo {
  static int count = 0;

  final int idx;
  final String name;
  final String desc;
  final String price;
  final String rating;
  final String img;

  CoffeePojo({
    required this.name,
    required this.desc,
    required this.price,
    required this.rating,
    required this.img,
  }) : idx = count++;
}