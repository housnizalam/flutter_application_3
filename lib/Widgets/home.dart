import 'package:flutter/material.dart';
import 'package:flutter_application_3/Widgets/appbar_actions/change_view_button.dart';
import 'package:flutter_application_3/Widgets/calendar_views/week_view.dart';
import 'package:flutter_application_3/Widgets/changing_time_bar/changing_view_bar.dart';
import 'package:flutter_application_3/bloc/apointment_app_bloc.dart';
import 'package:flutter_application_3/classes/calendar_month.dart';
import 'package:flutter_application_3/globals.dart';
import 'package:flutter_application_3/Widgets/calendar_views/month_view.dart';
import 'package:flutter_application_3/Widgets/calendar_views/year_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  CalendarMonth? calenderContent;
  Widget build(BuildContext context) {
    return BlocConsumer<ApointmentAppBloc, ApointmentAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              ChangeViewButton(),
            ],
            // title: Text(title),
          ),
          body: Center(
            child: Column(
              children: [
                ChangingTimeBar(),
                Expanded(
                  flex: 8,
                  child: viewMode == 'MonthView'
                      ? MonthView(
                          calenderContent:
                              state is CurrentState ? state.calenderContent : CalendarMonth.fromDateTime(selectedDate),
                        )
                      : viewMode == 'YearView'
                          ? const YearView()
                          : WeekView(
                              calenderContent: state is CurrentState
                                  ? state.calenderContent
                                  : CalendarMonth.fromDateTime(selectedDate),
                            ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
