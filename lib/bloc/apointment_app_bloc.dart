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
        selectedDate = DateTime(
            selectedDate.year, selectedDate.month + 1, selectedDate.day);
        calenderContent = CalendarMonth.fromDateTime(selectedDate);
      }
      if (event is PreviousMonthEvent) {
        selectedDate = DateTime(
            selectedDate.year, selectedDate.month - 1, selectedDate.day);
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
          textSize = 6;
        }
        print(viewMode);
      }
      if (event is AddApointment) {
        print(event.day.numberInMonth);
        selectedDay = event.day.addApointment(event.newApointment);
        selectedDay!.numberInMonth = event.day.numberInMonth;
        print(selectedDay!.numberInMonth);
        event.newApointment.display();

        if (selectedDay!.inThisMonth) {
          print(selectedDay!.appointments);
          selectedDate = DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDay!.numberInMonth,
          );
          calenderContent = CalendarMonth.fromDateTime(selectedDate);
          print(selectedDay!.appointments);
          print(selectedDay!.numberInMonth);
        }
      }
      if (state is PreviousWeekEvent) {
        selectedDate = DateTime(
            selectedDate.year, selectedDate.month, selectedDate.day - 7);
        calenderContent = CalendarMonth.fromDateTime(selectedDate);
        print(selectedDate.day);
      }
      if (state is NextWeekEvent) {
        selectedDate = DateTime(
            selectedDate.year, selectedDate.month, selectedDate.day + 7);

        calenderContent = CalendarMonth.fromDateTime(selectedDate);
        print(selectedDate.day);
      }
      if (state is NextYearEvent) {
        selectedDate = DateTime(selectedDate.year + 1, 1, 1);

        calenderContent = CalendarMonth.fromDateTime(selectedDate);
      }
      if (state is PreviousYearEvent) {
        selectedDate = DateTime(selectedDate.year - 1, 1, 1);

        calenderContent = CalendarMonth.fromDateTime(selectedDate);
      }
      emit(CurrentState(
          calenderContent: calenderContent, selectedDay: selectedDay));
    });
  }
}
