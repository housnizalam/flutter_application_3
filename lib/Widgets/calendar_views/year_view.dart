import 'package:flutter/material.dart';
import 'package:flutter_application_3/classes/calendar_month.dart';
import 'package:flutter_application_3/globals.dart';
import 'package:flutter_application_3/Widgets/calendar_views/month_view.dart';

class YearView extends StatefulWidget {
  const YearView({super.key});

  @override
  State<YearView> createState() => _YearViewState();
}

class _YearViewState extends State<YearView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.28),
      itemBuilder: (context, i) {
        selectedDate = DateTime(today.year, i + 1, selectedDate.day);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MonthView(
                calenderContent: CalendarMonth.fromDateTime(selectedDate),
              ),
            ),
          ),
        );
      },
    );
  }
}

