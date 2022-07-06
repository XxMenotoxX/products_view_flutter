class Cart {
  late int productId;
  late String  price;
  late String name;
  late String imagePath;
  late String quantity;

  Cart();

  Cart.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    quantity = map['quantity'];
    price = map['price'];
    imagePath = map['imagePath'];

  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['price'] = price;
    map['imagePath'] = imagePath;
    map['name'] = name;
    map['quantity'] = quantity;

    return map;
  }
}
