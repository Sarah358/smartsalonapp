class ServicesModel{

  late String name ;

  ServicesModel({required this.name});

  ServicesModel.fromJson(Map<String,dynamic>json){
    name = json['name'];
  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['name'] = this.name;
    return data;
  }
  
}