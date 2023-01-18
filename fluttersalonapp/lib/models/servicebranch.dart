class ServiceBranchModel{

  late String name ;
  late int price;

  ServiceBranchModel({required this.name,required this.price});

  ServiceBranchModel.fromJson(Map<String,dynamic>json){
    name = json['name'];
    price = json['price'];

  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;

    return data;
  }
  
}