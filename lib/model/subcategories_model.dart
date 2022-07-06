class SubCategories {
  late int id;
  late int idMainCategories;
  late String name ;
  late String imagePath ;

 SubCategories();
  SubCategories.fromMap(Map<String,dynamic>map){
    name= map['name'];
    imagePath = map['imagePath'];
    idMainCategories = map['idMainCategories'];

  }

  Map<String,dynamic>toMap(){
    Map<String ,dynamic>map = Map<String,dynamic>();
    map['name']= name;
    map['imagePath'] = imagePath;
    map['idMainCategories'] = idMainCategories;

    return map;
  }


}