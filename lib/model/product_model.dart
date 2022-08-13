class Products {
  late int? id;
  int? idSubCategories = 0;
  late String? price;
  late String? name;

  late String? imagePath;
  late String? productCount;

  late String? description;

  late String? shortDescription;
  late bool? isAddToCard;
  late bool? isFavorite;
  late String? subCategoriesName;
  late String? path;

  Products(
      {this.id,
      this.idSubCategories,
      this.price,
      this.name,
      this.imagePath,
      this.productCount,
      this.description,
      this.shortDescription,
      this.isAddToCard,
      this.isFavorite,
      this.subCategoriesName,
      this.path});
  

  Products.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    idSubCategories = map['idSubCategories'] ?? 1;
    price = map['price'];
    imagePath = map['imagePath'];
    description = map['description'];
    shortDescription = map['shortDescription'];
    productCount = map['productCount'];

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
    map['productCount'] = productCount;

    return map;
  }
}
