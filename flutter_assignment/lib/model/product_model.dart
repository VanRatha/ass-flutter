class Order {
  final int id;
  final String name;
  final String image;
  final double price;
  final double discount;

  Order(this.id, this.name, this.image, this.price, this.discount);
  static List<Order> orderlist = [
    Order(
        1,
        "Jitterbug Smart",
        "https://www.techenhancedlife.com/sites/default/files/styles/tel-image-full/public/resources/jitterbug.jpg?itok=IFyc-xkW",
        50.0,
        5.0),
    Order(
        2,
        "Mobile phone 1",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG1hpftGHY3TB6fjDQsbwoSFtKFvw6U8qiYA&usqp=CAU",
        12.2,
        2.2),
    Order(
        3,
        "Galaxy zZ",
        "https://www.grayingwithgrace.com/wp-content/uploads/2017/10/smart-flat.jpg",
        100,
        10.0),
    Order(
        4,
        "Jitterbug",
        "https://images.ctfassets.net/orf4d9wgx51u/5LFA0OS0ZNqXbhBRcqSBgK/d9928708195361611b37f8cd4d1dcf3b/lively-flip-pdp.png",
        90.0,
        20.0)
  ];
}
