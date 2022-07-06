class Products {
  late int id;
  late int idSubCategories;
  late String  price;
  late String name;

  late String imagePath;

  late String description;

  late String shortDescription;
  late bool isAddToCard;
  late bool isFavorite;
  late String subCategoriesName;
  late String path;

  Products();

  Products.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    idSubCategories = map['idSubCategories'];
    price = map['price'];
    imagePath = map['imagePath'];
    description = map['description'];
    shortDescription = map['shortDescription'];
    // isAddToCard = map['isAddToCard'];
    // isFavorite = map['isFavorite'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['price'] = price;
    map['imagePath'] = imagePath;
    map['description'] = description;
    map['shortDescription'] = shortDescription;
    // map['isAddToCard'] =
    // map['isFavorite'] =
    map['name'] = name;
    map['idSubCategories'] = idSubCategories;

    return map;
  }
}