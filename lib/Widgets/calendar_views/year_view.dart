import 'package:flutter/material.dart';
import 'package:flutter_application_3/classes/calendar_month.dart';
import 'package:flutter_application_3/globals.dart';
import 'package:flutter_application_3/Widgets/calendar_views/month_view.dart';
import 'package:jiffy/jiffy.dart';

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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 1.28),
      itemBuilder: (context, i) {
        DateTime thisMonth = DateTime(selectedDate.year, i + 1);
        selectedDate = DateTime(today.year, i + 1, selectedDate.day);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              children: [
                Expanded(child: Text('${Jiffy.parseFromDateTime(selectedDate).MMMM}')),
                Expanded(
                  flex: 11,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MonthView(
                      calenderContent: CalendarMonth.fromDateTime(selectedDate),
                    ),
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
