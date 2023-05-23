// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:flutter_application_3/classes/apointments.dart';
import 'package:flutter_application_3/globals.dart';

class CalendarDay {
  final int _dayNumber;
  final int _monthNumber=selectedDate.month;
  final int _yearNumber=selectedDate.year;
  final bool _inThisMonth;
  Color backgroundcolor = Colors.white;
  Color textColor = Colors.black;

  final List<Apointments> appointments = [];
 
  CalendarDay({required int dayNumber, bool inThisMonth = true})
      : _dayNumber = dayNumber,
        _inThisMonth = inThisMonth;

  int get numberInMonth => _dayNumber;
  int get monthNumber => _monthNumber;
  int get yearNumber => _yearNumber;
  bool get inThisMonth => _inThisMonth;
  set numberInMonth(int numberInMonth)=>_dayNumber;
  @override
  String toString() => _dayNumber.toString();
  
  CalendarDay addApointment(Apointments newApontment) {
    CalendarDay thisDay = CalendarDay(dayNumber: selectedDate.day);
    thisDay.appointments.add(newApontment);
    return thisDay;
  }
}
