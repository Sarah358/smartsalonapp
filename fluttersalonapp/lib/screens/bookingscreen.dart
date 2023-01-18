import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttersalonapp/models/servicebranch.dart';
import 'package:fluttersalonapp/models/servicesmodel.dart';
import 'package:fluttersalonapp/models/stylistmodel.dart';
import 'package:fluttersalonapp/state/state_management.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/BMColors.dart';
import 'package:im_stepper/stepper.dart';
import 'package:fluttersalonapp/cloud_firestore/allservicesref.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:fluttersalonapp/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SalonBooking extends StatefulWidget {
  @override
  _SalonBookingState createState() => _SalonBookingState();
}

class _SalonBookingState extends State<SalonBooking> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  int _currentStep = 0;
  String _selectedService = '';
  String _selectedStylist = '';
  String _selectedbranchService = '';
  int _selectedbranchServicePrice = 0;
  bool isServiceSelected = false;
  bool isServicebranchSelected = false;
  DateTime _selectedDate = DateTime.now();
  String _selectedTime = '';
 

  void selectService(String name) {
    _selectedService = name;
    isServiceSelected = true;
  }

  void selectbranchService(String name, int price) {
    _selectedbranchService = name;
    _selectedbranchServicePrice = price;
    isServicebranchSelected = true;
  }

  void selectStylist(String name) {
    _selectedStylist = name;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: bmLightScaffoldBackgroundColor,
        body: Column(
          children: [
            // step
            NumberStepper(
              activeStep: _currentStep,
              direction: Axis.horizontal,
              enableNextPreviousButtons: false,
              enableStepTapping: false,
              numbers: [1, 2, 3, 4, 5],
              stepColor: Colors.black,
              activeStepColor: Colors.grey,
              numberStyle: TextStyle(color: Colors.white),
            ),
            // screen
            Expanded(
              flex: 10,
              child: _currentStep == 0
                  ? displayServiceslist()
                  : _currentStep == 1
                      ? displayServiceBranch(_selectedService)
                      : _currentStep == 2
                          ? displayStylist(_selectedService)
                          : _currentStep == 3
                              ? displayTimeSlot(context, _selectedStylist)
                              : _currentStep == 4
                                  ? displayConfirm(context)
                                  : Container(),
            ),

            //button
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                      });
                    },
                    child: Text('Previous'),
                  )),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: isServiceSelected || isServicebranchSelected
                        ? () {
                            setState(() {
                              _currentStep < 4
                                  ? _currentStep += 1
                                  : _currentStep = 4;
                            });
                          }
                        : null,
                    child: Text('Next'),
                  )),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  //displayservices method
  displayServiceslist() {
    return FutureBuilder(
        future: getServices(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var services = snapshot.data as List<ServicesModel>;
            if (services == null || services.length == 0)
              return Center(
                child: Text("Cannot load services list"),
              );
            else
              return GestureDetector(
                child: ListView.builder(
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedService == services[index].name;
                    return Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.home_work,
                          color: Colors.black,
                        ),
                        trailing: isSelected ? Icon(Icons.check) : null,
                        title: Text(
                          '${services[index].name}',
                          style: GoogleFonts.robotoMono(),
                        ),
                        onTap: () {
                          setState(() {
                            selectService(services[index].name);
                          });
                        },
                      ),
                    );
                  },
                ),
              );
          }
        });
  }

  //displayservicesbranch method
  displayServiceBranch(String servicename) {
    return FutureBuilder(
        future: getServicebranch(servicename),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var servicebranch = snapshot.data as List<ServiceBranchModel>;
            if (servicebranch == null || servicebranch.length == 0)
              return Center(
                child: Text("Cannot load service branches list"),
              );
            else
              return GestureDetector(
                child: ListView.builder(
                  itemCount: servicebranch.length,
                  itemBuilder: (context, index) {
                    final isSelected =
                        _selectedbranchService == servicebranch[index].name;
                    _selectedbranchServicePrice == servicebranch[index].price;
                    return Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.home_outlined,
                          color: Colors.black,
                        ),
                        trailing: isSelected ? Icon(Icons.check) : null,
                        title: Text(
                          '${servicebranch[index].name}',
                          style: GoogleFonts.robotoMono(),
                        ),
                        subtitle: Text(
                          'ksh  ${servicebranch[index].price}',
                          style: GoogleFonts.robotoMono(
                              fontStyle: FontStyle.italic),
                        ),
                        onTap: () {
                          setState(() {
                            selectbranchService(servicebranch[index].name,
                                servicebranch[index].price);
                          });
                        },
                      ),
                    );
                  },
                ),
              );
          }
        });
  }

  //displaystylist method
  displayStylist(String selectedService) {
    return FutureBuilder(
        future: getStylist(selectedService),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var stylits = snapshot.data as List<StylistModel>;
            if (stylits == null || stylits.length == 0)
              return Center(
                child: Text("Cannot load stylists list"),
              );
            else
              return GestureDetector(
                child: ListView.builder(
                  itemCount: stylits.length,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedStylist == stylits[index].name;
                    return Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        trailing: isSelected ? Icon(Icons.check) : null,
                        title: Text(
                          '${stylits[index].name}',
                          style: GoogleFonts.robotoMono(),
                        ),
                        subtitle: RatingBarIndicator(
                          rating: stylits[index].rating,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                        onTap: () {
                          setState(() {
                            selectStylist(stylits[index].name);
                          });
                        },
                      ),
                    );
                  },
                ),
              );
          }
        });
  }

  //displaytimeslot method
  displayTimeSlot(BuildContext context, String selectedStylist) {
    var now = _selectedDate;
    return Column(
      children: [
        Container(
          color: Color(0xFF008577),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          '${DateFormat.MMM().format(now)}',
                          style: GoogleFonts.robotoMono(color: Colors.white54),
                        ),
                        Text(
                          '${now.day}',
                          style: GoogleFonts.robotoMono(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          '${DateFormat.EEEE().format(now)}',
                          style: GoogleFonts.robotoMono(color: Colors.white54),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: now,
                      maxTime: now.add(
                        Duration(days: 31),
                      ),
                      onConfirm: (date) => {
                            setState(() {
                              _selectedDate = date;
                            })
                          });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
              itemCount: TIME_SLOT.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTime = TIME_SLOT.elementAt(index);
                      });
                    },
                    child: Card(
                      color: _selectedTime == TIME_SLOT.elementAt(index)
                          ? Colors.white54
                          : Colors.white,
                      child: GridTile(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${TIME_SLOT.elementAt(index)}'),
                              Text('Available'),
                            ],
                          ),
                        ),
                        header: _selectedTime == TIME_SLOT.elementAt(index)
                            ? Icon(Icons.check)
                            : null,
                      ),
                    ),
                  )),
        )
      ],
    );
  }

  //confirmbooking method
confirmBooking(BuildContext context) {
   //var hour = int.parse(_selectedTime.split(':')[0].padLeft(2, "0"));
    //var minutes = int.parse(_selectedTime.split(':')[1].padLeft(2, "0"));
    var timeStamp = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      //hour,
      //minutes
    ).microsecondsSinceEpoch ~/ 1000;
    var submitData = {
      'service': _selectedService,
      'servicebranch': _selectedbranchService,
      'stylistname': _selectedStylist,
      'username': FirebaseAuth.instance.currentUser?.uid,
      'done': false,
      'serviceprice': _selectedbranchServicePrice,
      'slot': _selectedTime,
      'timestamp': timeStamp,
      'time':
          '${_selectedTime} - ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
    };
    FirebaseFirestore.instance
        .collection('stylist')
        .doc(_selectedStylist)
        .collection('${DateFormat('dd_MM_yyyy').format(_selectedDate)}')
        .doc(_selectedTime)
        .set(submitData)
        .then((value) {
          Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Booked successfully'),
        ),
      );
      // reset value
      _selectedDate = DateTime.now();
    });
  }



  displayConfirm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Image.asset('images/salon_three.jpg'),
          ),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Thank you for booking our services !'.toUpperCase(),
                      style:
                          GoogleFonts.robotoMono(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Booking information !'.toUpperCase(),
                      style: GoogleFonts.robotoMono(),
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${_selectedTime} - ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
                          style: GoogleFonts.robotoMono(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${_selectedStylist} ',
                          style: GoogleFonts.robotoMono(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Icon(Icons.home),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${_selectedbranchService} ',
                          style: GoogleFonts.robotoMono(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.price_check),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${_selectedbranchServicePrice} ',
                          style: GoogleFonts.robotoMono(),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => {confirmBooking(context)},
                      child: Text('Confirm'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black26),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
