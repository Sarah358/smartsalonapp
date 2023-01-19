import 'package:ntp/ntp.dart';

const TIME_SLOT = {
  '8:00-9:00',
  '9:00-10:00',
  '10:00-11:00',
  '11:00-12:00',
  '12:00-13:00',
  '13:00-14:00',
  '14:00-15:00',
  '15:00-16:00',
  '16:00-17:00',
  '17:00-18:00',
  '18:00-19:00',
  '19:00-20:00',
  '20:00-21:00',


  

};

Future<int> getMaxAvailableTimeSlot(DateTime dt) async{
  DateTime now = dt.toLocal();
  int offset = await NTP.getNtpOffset(localTime: now);    //sync time with server
  DateTime syncTime = now.add(Duration(microseconds: offset));
  //compare synctime with local time to enable time slot 
   if(syncTime.isBefore(DateTime(now.year,now.month,now.day,8,0)))
  return 0;    ///retrun next slot available
 else if(syncTime.isAfter(DateTime(now.year,now.month,now.day,8,0)) && syncTime.isBefore(DateTime(now.year,now.month,now.day,9,0)))
  return 1;
  else if (syncTime.isAfter(DateTime(now.year,now.month,now.day,9,0)) && syncTime.isBefore(DateTime(now.year,now.month,now.day,10,0)))
  return 2;
   else if (syncTime.isAfter(DateTime(now.year,now.month,now.day,10,0)) && syncTime.isBefore(DateTime(now.year,now.month,now.day,11,0)))
  return 3;
    else if (syncTime.isAfter(DateTime(now.year,now.month,now.day,11,0)) && syncTime.isBefore(DateTime(now.year,now.month,now.day,12,0)))
  return 4;
    else if (syncTime.isAfter(DateTime(now.year,now.month,now.day,12,0)) && syncTime.isBefore(DateTime(now.year,now.month,now.day,13,0)))
  return 5;
    else if (syncTime.isAfter(DateTime(now.year,now.month,now.day,13,0)) && syncTime.isBefore(DateTime(now.year,now.month,now.day,14,0)))
  return 6;
    else if (syncTime.isAfter(DateTime(now.year,now.month,now.day,14,0)) && syncTime.isBefore(DateTime(now.year,now.month,now.day,15,0)))
  return 7;
    else if (syncTime.isAfter(DateTime(now.year,now.month,now.day,15,0)) && syncTime.isBefore(DateTime(now.year,now.month,now.day,16,0)))
  return 8;
    else if (syncTime.isAfter(DateTime(now.year,now.month,now.day,16,0)) && syncTime.isBefore(DateTime(now.year,now.month,now.day,17,0)))
  return 9;
    else if (syncTime.isAfter(DateTime(now.year,now.month,now.day,17,0)) && syncTime.isBefore(DateTime(now.year,now.month,now.day,18,0)))
  return 10;
    else if (syncTime.isAfter(DateTime(now.year,now.month,now.day,18,0)) && syncTime.isBefore(DateTime(now.year,now.month,now.day,19,0)))
  return 11;
    else if (syncTime.isAfter(DateTime(now.year,now.month,now.day,19,0)) && syncTime.isBefore(DateTime(now.year,now.month,now.day,20,0)))
  return 12;
    else if (syncTime.isAfter(DateTime(now.year,now.month,now.day,20,0)) && syncTime.isBefore(DateTime(now.year,now.month,now.day,21,0)))
  return 13;
  else return 14;
}