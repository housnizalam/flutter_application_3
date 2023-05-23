// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/bloc/apointment_app_bloc.dart';
import 'package:flutter_application_3/classes/apointments.dart';
import 'package:flutter_application_3/classes/calendar_day.dart';
import 'package:flutter_application_3/classes/calendar_month.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_application_3/globals.dart';

class MonthView extends StatelessWidget {
  final CalendarMonth calenderContent;
  const MonthView({
    Key? key,
    required this.calenderContent,
  }) : super(key: key);
  Widget build(BuildContext context) => BlocConsumer<ApointmentAppBloc, ApointmentAppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          TextEditingController hour = TextEditingController();
          TextEditingController minute = TextEditingController();
          TextEditingController dauer = TextEditingController();
          TextEditingController tittle = TextEditingController();
          TextEditingController place = TextEditingController();
          TextEditingController prioritate = TextEditingController();
          return Row(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: calenderContent.days.length + calenderContent.weeks.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
                  itemBuilder: (context, i) {
                    final weekDay = i % 8;
                    final weekIndex = (i / 8).floor();
                    final week = calenderContent.weeks[weekIndex];
                    final day = weekDay != 0 ? week.weekDays[weekDay - 1] : null;
                    return day == null
                        ? Card(
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                '${week.weekNumber}',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: textSize),
                              ),
                            ),
                          )
                        : Card(
                            color: day.backgroundcolor,
                            child: InkWell(
                              onTap: () {
                                if (state is CurrentState && state.selectedDay != null) {
                                  print(state.selectedDay!.appointments);
                                  print(state.selectedDay!.numberInMonth);
                                }
                              },
                              onDoubleTap: () {
                                AwesomeDialog(
                                  context: context,
                                  body: Column(
                                    children: [
                                      TextFormField(
                                        controller: hour,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.person),
                                          labelText: 'Hour *',
                                        ),
                                      ),
                                      TextFormField(
                                        controller: minute,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.person),
                                          labelText: 'Minute *',
                                        ),
                                      ),
                                      TextFormField(
                                        controller: dauer,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.person),
                                          labelText: 'Dauer *',
                                        ),
                                      ),
                                      TextFormField(
                                        controller: tittle,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.person),
                                          labelText: 'tittle *',
                                        ),
                                      ),
                                      TextFormField(
                                        controller: place,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.person),
                                          labelText: 'Place *',
                                        ),
                                      ),
                                      TextFormField(
                                        controller: prioritate,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.person),
                                          labelText: 'Prioritate 1=>3 *',
                                        ),
                                      ),
                                    ],
                                  ),
                                  dialogType: DialogType.noHeader,
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  width: 280,
                                  buttonsBorderRadius: const BorderRadius.all(
                                    Radius.circular(2),
                                  ),
                                  animType: AnimType.bottomSlide,
                                  title: 'add Apointment',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {
                                    final newApointment = Apointments(
                                        apointmentstart: DateTime(
                                          selectedDate.year,
                                          selectedDate.month,
                                          selectedDate.day,
                                          int.parse(hour.text),
                                          int.parse(minute.text),
                                        ),
                                        dauer: int.parse(dauer.text),
                                        place: place.text,
                                        prioritate: int.parse(prioritate.text),
                                        tittle: tittle.text);
                                    print('Newapointment tittle');
                                    print(newApointment.tittle);
                                    BlocProvider.of<ApointmentAppBloc>(context)
                                        .add(AddApointmentDay(day: day, apointment: newApointment));
                                  },
                                ).show();
                              },
                              child: Center(
                                child: Text(
                                  '$day',
                                  style:
                                      TextStyle(color: day.textColor, fontSize: textSize, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                  },
                ),
              ),
            ],
          );
        },
      );
}
