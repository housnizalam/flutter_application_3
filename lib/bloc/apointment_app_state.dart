// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'apointment_app_bloc.dart';

@immutable
abstract class ApointmentAppState {}

class ApointmentAppInitial extends ApointmentAppState {}

class CurrentState extends ApointmentAppState {
  CalendarMonth calenderContent;
  CalendarDay? selectedDay;

  CurrentState({
    required this.calenderContent,
    required this.selectedDay,
  });
}
