class MainCategories {
  late int id;
  late String name ;
  late String description ;
  late String imagePath ;


  MainCategories.fromMap(Map<String,dynamic>map){
    name= map['name'];
    description = map['description'];
    imagePath = map['imagePath'];

  }

  Map<String,dynamic>toMap(){
    Map<String ,dynamic>map = Map<String,dynamic>();
    map['name']= name;
    map['description']= description;
    map['imagePath'] = imagePath;

    return map;
  }


}