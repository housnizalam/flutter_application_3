// ignore_for_file: unused_field
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class CalendarDay {
  final int _dayNumber;
  final bool _inThisMonth;
  Color backgroundcolor = Colors.white;
  Color textColor = Colors.black;
  
  final List _appointments = []; //TODO: List<Appointment>

  CalendarDay({required int dayNumber, bool inThisMonth = true})
      : _dayNumber = dayNumber,
        _inThisMonth = inThisMonth;

  int get numberInMonth => _dayNumber;
  bool get inThisMonth => _inThisMonth;

  @override
  String toString() => _dayNumber.toString();
}
