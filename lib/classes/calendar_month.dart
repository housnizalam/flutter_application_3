import 'package:flutter_application_3/classes/calendar_day.dart';
import 'package:flutter_application_3/classes/calendar_week.dart';
import 'package:jiffy/jiffy.dart';


class CalendarMonth {
  final String _monthName;
  final List<CalendarWeek> _weeks;

  CalendarMonth._internal({required String monthName, List<CalendarWeek>? days})
      : _monthName = monthName,
        _weeks = days ?? <CalendarWeek>[];

  /// Name des Monats
  String get monthName => _monthName;

  /// Gibt alle Wochen aus
  List<CalendarWeek> get weeks => _weeks;

  /// Gibt eine Liste Aller Tage des Monats aus
  List<CalendarDay> get days {
    final days = <CalendarDay>[];
    for (final week in _weeks) {
      days.addAll(week.weekDays);
    }
    return days;
  }

  factory CalendarMonth.fromDateTime(DateTime selectedDate) {
    
    CalendarMonth calendarMonth = CalendarMonth._internal(monthName: Jiffy.parseFromDateTime(selectedDate).MMMM);
    //Erster Tag des Monats
    final thisMonthFirstDay = DateTime(selectedDate.year, selectedDate.month, 1);

    var currentWeek = thisMonthFirstDay;
    //Füge 5 Wochen hinzu die in diesen Monat sind.
    for (var i = 0; i < 6; i++) {
      calendarMonth._weeks.add(CalendarWeek.fromDateTime(dayOfWeek: currentWeek, thisMonth: selectedDate.month));
      currentWeek = currentWeek.add(const Duration(days: 7));
    }
    return calendarMonth;
  }
}
