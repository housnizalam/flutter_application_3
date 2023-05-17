import 'package:flutter/material.dart';
import 'package:flutter_application_3/classes/calendar_day.dart';
import 'package:flutter_application_3/globals.dart';

class CalendarWeek {
  int _weekNumber;
  List<CalendarDay> _weekDays;

  CalendarWeek._internal({required int weekNumber, List<CalendarDay>? days})
      : _weekNumber = weekNumber,
        _weekDays = days ?? [];

  int get weekNumber => _weekNumber;
  List<CalendarDay> get weekDays => _weekDays;

  bool addDay(CalendarDay day) {
    if (_weekDays.length >= 7) return false;
    _weekDays.add(day);
    return true;
  }

  factory CalendarWeek.fromDateTime({required DateTime dayOfWeek, required int thisMonth}) {
    var currentDay = dayOfWeek;
    final newWeek = CalendarWeek._internal(weekNumber: _weekNumberOfDate(dayOfWeek));

    //Wir suchen den vorrigen Montag wenn uns kein Montag gegeben wurde.
    while (currentDay.weekday != 1) {
      currentDay = currentDay.subtract(const Duration(days: 1));
    }
    // Fügen alle Tage bis zum nächsten Sonntag hinzu
    while (currentDay.weekday != 7) {
      final newDay = CalendarDay(
        dayNumber: currentDay.day,
        inThisMonth: currentDay.month == thisMonth,
      );
      // Die hintergrund Farben von heute und gewählter Tag fügen
      if (selectedDate.year == today.year && selectedDate.month == today.month && newDay.numberInMonth == today.day) {
        newDay.backgroundcolor = Colors.blue;
      } else if (newDay.numberInMonth == selectedDate.day && newDay.inThisMonth) {
        newDay.backgroundcolor = Colors.grey;
      }
      // Die Farben von außen Tagen Texte fügen
      if (!newDay.inThisMonth) {
        newDay.textColor = Color.fromARGB(108, 158, 158, 158);
      }
      newWeek.addDay(newDay);

      currentDay = currentDay.add(const Duration(days: 1));
    }
    // Die hintergrund Farben von heute und gewählter Tag für den letzten Tag der Woche fügen
    final newDay = CalendarDay(dayNumber: currentDay.day, inThisMonth: currentDay.month == thisMonth);
    if (selectedDate.year == today.year && selectedDate.month == today.month && newDay.numberInMonth == today.day) {
      newDay.backgroundcolor = Colors.blue;
    } else if (newDay.numberInMonth == selectedDate.day && newDay.inThisMonth) {
      newDay.backgroundcolor =  Colors.grey;
    }
    // Die Farben von außen Tagen Texte für den letzten Tag der Woche fügen
    if (!newDay.inThisMonth) {
      newDay.textColor = Color.fromARGB(108, 158, 158, 158);
    }
    newWeek.addDay(newDay);

    return newWeek;
  }

  //Berechne die Wochennummer des gegebenen Tages
  static int _weekNumberOfDate(DateTime date) {
    date = DateTime.utc(date.year, date.month, date.day);

    //Wir brauchen die Anzahl der tage seid dem ersten Montag des Jahres
    var daysThisYear = _numberDaysSinceFirstMondayOfYear(date, date.year);
    //Wenn eine negative Zahl kommt wissen wir, dass der genannte tag VOR dem ersten Montag ist
    if (daysThisYear < 0) {
      //Dann brauchen wir die anzahl der Tage bis zum ersten Montag des Vorjahres
      daysThisYear = _numberDaysSinceFirstMondayOfYear(date, date.year - 1);
    }

    var kw = (daysThisYear / 7).floor() + 1;

    return kw;
  }

  static int _numberDaysSinceFirstMondayOfYear(DateTime date, int year) {
    var firstDay = DateTime.utc(year, 1, 1);
    var days = date.difference(firstDay).inDays;
    if (firstDay.weekday != 1) {
      days = days + firstDay.weekday - 8;
    }
    // print("Number Of Days in Year $year :$days");

    return days;
  }
}
