import 'package:flutter/material.dart';
import 'package:flutter_application_3/bloc/apointment_app_bloc.dart';
import 'package:flutter_application_3/globals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

class ChangingTimeBar extends StatelessWidget {
  const ChangingTimeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApointmentAppBloc, ApointmentAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Expanded(
          child: Row(
            children: [
              Expanded(child: SizedBox()),
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (viewMode == 'MonthView') {
                      BlocProvider.of<ApointmentAppBloc>(context).add(PreviousMonthEvent());
                    } else if (viewMode == 'WeekView') {
                      BlocProvider.of<ApointmentAppBloc>(context).add(PreviousWeekEvent());
                    } else {
                      BlocProvider.of<ApointmentAppBloc>(context).add(PreviousYearEvent());
                    }
                  },
                  child: Card(
                    child: Icon(Icons.arrow_left),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  Jiffy.parseFromDateTime(selectedDate).format(pattern: 'EEEE d/MMM/y'),
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (viewMode == 'MonthView') {
                      BlocProvider.of<ApointmentAppBloc>(context).add(NextMonthEvent());
                    } else if (viewMode == 'WeekView') {
                      BlocProvider.of<ApointmentAppBloc>(context).add(NextWeekEvent());
                    } else {
                      BlocProvider.of<ApointmentAppBloc>(context).add(NextYearEvent());
                    }
                  },
                  child: Card(
                    child: Icon(Icons.arrow_right),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        );
      },
    );
  }
}
