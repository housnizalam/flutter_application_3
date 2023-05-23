import 'package:flutter_application_3/classes/appstate.dart';
import 'package:flutter_application_3/classes/calendar_day.dart';
import 'package:flutter_application_3/classes/calendar_week.dart';

DateTime selectedDate = DateTime.now();
DateTime today = DateTime.now();
String viewMode = 'MonthView';
double textSize = 15;
final appstate = Appstate();

enum CalenarViewMode {
  WeekView,
  MonthView,
  YearView,
}

bool isThisDayCreated(int i) {
  bool result = false;
  if (appstate.apointmentDays.isEmpty) {
    return false;
  }
  final thisDay = CalendarDay(dayNumber: i);
  for (CalendarDay day in appstate.apointmentDays) {
    if (thisDay.yearNumber == day.yearNumber &&
        thisDay.monthNumber == day.monthNumber &&
        thisDay.numberInMonth == day.numberInMonth) {
      result = true;
    }
  }
  return result;
}

int? getThisDayIndex(int i) {
  CalendarDay thisDay = CalendarDay(dayNumber: i);
  if (appstate.apointmentDays.isEmpty) return null;
  int index = 0;
  for (CalendarDay day in appstate.apointmentDays) {
    if (thisDay.yearNumber == day.yearNumber &&
        thisDay.monthNumber == day.monthNumber &&
        thisDay.numberInMonth == day.numberInMonth) {
      return index;
    }
    index++;
  }
  return null;
}


