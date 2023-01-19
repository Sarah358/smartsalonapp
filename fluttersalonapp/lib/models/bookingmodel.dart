import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel{
  late String stylistname,service,servicebranch,time,slot;
  late bool done;
  late int timestamp,serviceprice;

 // final DocumentReference reference;
  
  BookingModel(
   {required this.stylistname,
     required this.service, 
     required this.servicebranch,
      required this.serviceprice,
       required this.time, 
       required this.done, 
       required this.slot, 
       required this.timestamp
 });


 
  BookingModel.fromJson(Map<String,dynamic>json){
    stylistname = json['stylistname'];
    service = json['service'];
    servicebranch = json['servicebranch'];
    time = json['time'];
    done = json['done']as bool;
    slot = json['slot'];
    timestamp = int.parse(json['timestamp'] ==null ? '0': json['timestamp'].toString());


  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['stylistname'] = this.stylistname;
    data['service'] = this.service;
    data['servicebranch'] = this.servicebranch;
    data['time'] = this.time;
    data['done'] = this.done;
    data['slot'] = this.slot;
    data['timestamp'] = this.timestamp;
   

    return data;
  }
}
