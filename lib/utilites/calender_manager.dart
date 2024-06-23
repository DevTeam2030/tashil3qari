import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/contants.dart';


class CalenderManager{
 // static DateTime startDateTime=DateTime.now();

  static List<DateTime> getDays({DateTime? fromDate,DateTime? endDate}) {
    DateTime startDateTime=fromDate??DateTime.now();
    DateTime endDateTime=endDate??startDateTime.add(const Duration(days: 365));

    //print('startDateTime.toString()');
    //print(startDateTime.toString());
    //print('endDateTime.toString()');
    //print(endDateTime.toString());
    DateTime startDateInUTC = DateTime.utc(startDateTime.year, startDateTime.month, startDateTime.day);
    DateTime endDateInUTC = DateTime.utc(endDateTime.year, endDateTime.month, endDateTime.day);

    List<DateTime> daysInFormat= [];
    daysInFormat.add(startDateTime);
    for (DateTime i = startDateInUTC.add(const Duration(days: 1));
    i.isBefore(endDateInUTC);
    i = i.add(const Duration(days: 1))) {
      if (startDateTime.isUtc) {
        // if(checkDayIsActiveToBook( date: i)){
        //   daysInFormat.add(i);
        // }
        //print(i.toString() +'  ----');
        daysInFormat.add(i);

      } else {
        // if(checkDayIsActiveToBook( date: i)){
          daysInFormat.add(DateTime(i.year, i.month, i.day));
        // }

      }
    }
    return daysInFormat;
  }

  // List<DateTime> getYearsInBetween(DateTime startDate, DateTime endDate) {
  //   List<DateTime> days = [];
  //   for (int i = 0; i <= endDate.difference(startDate).; i++) {
  //     days.add(startDate.add(Duration(days: i)));
  //   }
  //   return days;
  // }
  static List<int> getYears({required DateTime fromDate,required DateTime endDate}) {
    List<int>years=[];
    for( int i=endDate.year;i>=fromDate.year;i--){
      years.add(i);
    }
    return years;
  }

  // static Color getDayColor({required DateTime date,required DateTime selectDate}) {
  //   Color color=ColorManager.primaryButtonColor;
  // DateTime  now=DateTime.now();
  //
  //   DateTime nowDate=DateTime(now.year,now.month,now.day);
  //   DateTime calenderDate=DateTime(date.year,date.month,date.day);
  //   DateTime selected=DateTime(selectDate.year,selectDate.month,selectDate.day);
  //
  //
  //   if (nowDate==calenderDate) {
  //   // if (nowDate==calenderDate&&nowDate==selected) {
  //     color=ColorManager.primaryButtonColor;
  //   } else if (calenderDate==selected) {
  //     color=ColorManager.dayColor;
  //   }else{
  //     color=ColorManager.white;
  //   }
  //
  //   return color;
  // }

  static String getDayName({required DateTime date}) {
    bool isArabic=Constants.isArabic;
    switch (date.weekday.toString()){
      case '1': return !isArabic?'Mon':'الأثنين';

      case '2': return !isArabic?'Tue':'الثلاثاء';

      case '3':  return !isArabic?'Wed':'الأربعاء';

      case '4': return !isArabic?'Thu':'الخميس';


      case '5': return !isArabic?'Fri':'الجمعه';


      case '6':  return !isArabic?'Sat':'السبت';


      case '7':return !isArabic?'Sun':'الأحد';

      default:
        break;
    }


    return '';
  }

  // static bool checkDayIsActiveToBook({required DateTime date}) {
  //   // saturday - sunday - monday - tuesday - wednesday - thursday - friday
  //   bool isArabic=Constants.isArabic;
  //   switch (date.weekday.toString()){
  //     case '1': return Constants.settingData.closedDaysReservation.contains('monday'.toLowerCase())?false:true;
  //
  //     case '2': return Constants.settingData.closedDaysReservation.contains('tuesday'.toLowerCase())?false:true;
  //
  //     case '3':  return Constants.settingData.closedDaysReservation.contains('wednesday'.toLowerCase())?false:true;
  //
  //     case '4': return Constants.settingData.closedDaysReservation.contains('thursday'.toLowerCase())?false:true;
  //
  //
  //     case '5': return Constants.settingData.closedDaysReservation.contains('friday'.toLowerCase())?false:true;
  //
  //
  //     case '6':  return Constants.settingData.closedDaysReservation.contains('saturday'.toLowerCase())?false:true;
  //
  //
  //     case '7':return Constants.settingData.closedDaysReservation.contains('sunday'.toLowerCase())?false:true;
  //
  //     default:
  //       break;
  //   }
  //
  //
  //   return true;
  // }




  static String getMonthName({required DateTime date}) {
    bool isArabic=Constants.isArabic;
    switch (date.month.toString()){
      case '1': return !isArabic?'Jan':'يناير';

      case '2': return !isArabic?'Feb':'فبراير';

      case '3':  return !isArabic?'Mar':'مارس';

      case '4': return !isArabic?'Apr':'أبريل';


      case '5': return !isArabic?'May':'مايو';


      case '6':  return !isArabic?'Jun':'يونيو';


      case '7':return !isArabic?'Jul':'يوليو';
      case '8':return !isArabic?'Aug':'أغسطس';
      case '9':return !isArabic?'Sept':'سبتمبر';
      case '10':return !isArabic?'Oct':'أكتوبر';
      case '11':return !isArabic?'Nov':'نوفمبر';
      case '12':return !isArabic?'Dec':'ديسمبر';

      default:
        break;
    }


    return '';
  }


  static String getHourName({required String time}) {
    int hour=int.parse(time.split(':')[0]);
    int m=int.parse(time.split(':')[1]);
   String min=m<10?('$m''0'):'$m';
    String txt='';
    if(hour==12){
      txt='$hour:$min ${'pm'.tr()}';
    }
    else if(hour==00){
      txt='12:$min ${'am'.tr()}';
    }
    else  if(hour==24){
      txt='${hour-12}:$min ${'am'.tr()}';
    }
    else  if(hour>12){
      txt='${hour-12}:$min ${'pm'.tr()}';
    }
    else  if(hour<10){
      txt='0$hour:$min ${'am'.tr()}';
    }else{

        txt='$hour:$min ${'am'.tr()}';

    }
    return txt;
  }



  static String getDateName({required DateTime date}) {
  String month= getMonthName(date: date);
    return '${date.day} $month , ${date.year}';
  }
  static String getTimeName({required TimeOfDay time}) {
    return '${time.hour>=10?time.hour:'0${time.hour}'} ${time.minute>=10?time.minute:'0${time.minute}'} , 00';
  }
  static String getDayMonthName({required DateTime date}) {
    String month= getMonthName(date: date);
    return '${date.day} $month';
  }
  static int differenceDateTime({required DateTime date}) {
    final date2 = DateTime.now();
    int difference = date2.difference(date).inDays;
    return difference;
  }

  static String getBirthDateName({required DateTime birthDate}) {
  String date= "${birthDate.year}-${birthDate.month>=10?birthDate.month:'0${birthDate.month}'}-"
      "${birthDate.day>=10?birthDate.day:'0${birthDate.day}'}";
    return date;
  }



}