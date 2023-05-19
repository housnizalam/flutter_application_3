// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'apointment_app_bloc.dart';

@immutable
abstract class ApointmentAppEvent {}

class NextMonthEvent extends ApointmentAppEvent {}

class PreviousMonthEvent extends ApointmentAppEvent {}

class NextWeekEvent extends ApointmentAppEvent {}

class PreviousWeekEvent extends ApointmentAppEvent {}

class NextYearEvent extends ApointmentAppEvent {}

class PreviousYearEvent extends ApointmentAppEvent {}

class ChangeViewEvent extends ApointmentAppEvent {}

class AddApointment extends ApointmentAppEvent {
  CalendarDay day;
  Apointments newApointment;
  AddApointment({
    required this.day,
    required this.newApointment,
  });
}
