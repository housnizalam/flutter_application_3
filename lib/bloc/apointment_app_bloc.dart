import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/classes/apointments.dart';
import 'package:flutter_application_3/classes/calendar_day.dart';
import 'package:flutter_application_3/classes/calendar_month.dart';
import 'package:flutter_application_3/globals.dart';
import 'package:meta/meta.dart';
part 'apointment_app_event.dart';
part 'apointment_app_state.dart';

class ApointmentAppBloc extends Bloc<ApointmentAppEvent, ApointmentAppState> {
  ApointmentAppBloc() : super(ApointmentAppInitial()) {
    CalendarMonth calenderContent = CalendarMonth.fromDateTime(selectedDate);
    CalendarDay? selectedDay;
    on<ApointmentAppEvent>((event, emit) {
      if (event is NextMonthEvent) {
        selectedDate = DateTime(selectedDate.year, selectedDate.month + 1, selectedDate.day);
        calenderContent = CalendarMonth.fromDateTime(selectedDate);
      }
      if (event is PreviousMonthEvent) {
        selectedDate = DateTime(selectedDate.year, selectedDate.month - 1, selectedDate.day);
        calenderContent = CalendarMonth.fromDateTime(selectedDate);
      }
      if (event is ChangeViewEvent) {
        if (viewMode == 'YearView') {
          textSize = 15;
          selectedDate = today;
          viewMode = 'MonthView';
        } else if (viewMode == 'MonthView') {
          textSize = 15;
          viewMode = 'WeekView';
        } else if (viewMode == 'WeekView') {
          viewMode = 'YearView';
          textSize = 15;
        }
        print(viewMode);
      }
      if (event is AddApointmentDay) {
        if (isThisDayCreated(event.day.numberInMonth) == false) {
          final thisDay = CalendarDay(dayNumber: event.day.numberInMonth);
          final newApointment = event.apointment;
          thisDay.appointments.add(newApointment);
          appstate.apointmentDays.add(thisDay);
          calenderContent = CalendarMonth.fromDateTime(selectedDate);
          print('number of apointments');

          print(thisDay.appointments.length);
        } else {
          int index = getThisDayIndex(event.day.numberInMonth)!;
          appstate.apointmentDays[index].appointments.add(event.apointment);
        }
        print('number of days');
        print(appstate.apointmentDays.length);
        print('number of apointments from appstate');
        print(appstate.apointmentDays[0].appointments.length);
      }

      if (event is PreviousWeekEvent) {
        selectedDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day - 7);
        calenderContent = CalendarMonth.fromDateTime(selectedDate);
        print(selectedDate.day);
      }
      if (event is NextWeekEvent) {
        selectedDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day + 7);

        calenderContent = CalendarMonth.fromDateTime(selectedDate);
        print(selectedDate.day);
      }
      if (event is NextYearEvent) {
        selectedDate = DateTime(selectedDate.year + 1, 1, 1);

        calenderContent = CalendarMonth.fromDateTime(selectedDate);
      }
      if (event is PreviousYearEvent) {
        selectedDate = DateTime(selectedDate.year - 1, 1, 1);

        calenderContent = CalendarMonth.fromDateTime(selectedDate);
      }

      emit(CurrentState(calenderContent: calenderContent, selectedDay: selectedDay));
    });
  }
}
