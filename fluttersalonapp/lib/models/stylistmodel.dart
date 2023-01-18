
class StylistModel{

  late String name ;
  late double rating;
  late int ratingTimes;
  late String userName ;
  



  StylistModel({required this.name,required this.rating,required this.ratingTimes,required this.userName});

  StylistModel.fromJson(Map<String,dynamic>json){
    name = json['name'];
    rating = double.parse(json['rating'] ==null ?'0':json['rating'].toString());
    ratingTimes = int.parse(json['ratingTimes'] ==null ?'0':json['ratingTimes'].toString());
    userName = json['userName'];
  


  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['ratingTimes'] = this.ratingTimes;
    data['userName'] = this.userName;
   


    return data;
  }
  
}