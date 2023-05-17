// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_3/bloc/apointment_app_bloc.dart';
import 'package:flutter_application_3/classes/calendar_month.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                                BlocProvider.of<ApointmentAppBloc>(context).add(SelectDay(i: i));
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
