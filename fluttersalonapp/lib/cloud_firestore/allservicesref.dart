import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttersalonapp/models/servicesmodel.dart';
import 'package:fluttersalonapp/models/servicebranch.dart';
import 'package:fluttersalonapp/models/stylistmodel.dart';

Future<List<ServicesModel>> getServices() async {
  var services = new List<ServicesModel>.empty(growable: true);
  var servicesref = FirebaseFirestore.instance.collection('services');
  var snapshot = await servicesref.get();
  snapshot.docs.forEach((element) {
    services.add(ServicesModel.fromJson(element.data()));
  });
  return services;
}

Future<List<ServiceBranchModel>> getServicebranch(String servicename) async {
  var servicebranch = new List<ServiceBranchModel>.empty(growable: true);
  var servicebranchref = FirebaseFirestore.instance
      .collection('services')
      .doc(servicename)
      .collection('Branch');
  var snapshot = await servicebranchref.get();
  snapshot.docs.forEach((element) {
    servicebranch.add(ServiceBranchModel.fromJson(element.data()));
  });
  return servicebranch;
}

Future<List<StylistModel>> getStylist(String service) async {
  var stylists = new List<StylistModel>.empty(growable: true);
  var sylistref = FirebaseFirestore.instance
      .collection('services')
      .doc(service)
      .collection('stylist');
  var snapshot = await sylistref.get();
  snapshot.docs.forEach((element) {
    stylists.add(StylistModel.fromJson(element.data()));
  });
  return stylists;
}

Future<List<int>> getTimeSlotsOfStylist(String stylist, String date) async {
  var bookingRef = FirebaseFirestore.instance
      .collection('stylist')
      .doc(stylist)
      .collection(date);
  var snapshots = await bookingRef.get();
  var result = <int>[];
  snapshots.docs.forEach((doc) {
    var data = doc.data();
    String time = data['slot'];
    List<String> timeslot = time.split("-");
    int starttime = int.parse(timeslot[0].split(":")[0]);
    int endtime = int.parse(timeslot[1].split(":")[0]);
    result.addAll(List.generate(endtime - starttime, (i) => i));
  });
  return result;
}



