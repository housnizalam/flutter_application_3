import 'package:flutter_application_3/classes/apointments.dart';
import 'package:flutter_application_3/classes/calendar_day.dart';

class Appstate {
  List<CalendarDay> apointmentDays = [];
  display() {
    for (CalendarDay day in apointmentDays) {
      print('dayNumber : ${day.numberInMonth} , dayApointments : ');
      int i = 0;
      for (Apointments apointment in day.appointments) {
        day.appointments[i].display();
      }
    }
  }
}
