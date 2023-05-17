import 'package:flutter/material.dart';
import 'package:flutter_application_3/bloc/apointment_app_bloc.dart';

import 'package:flutter_application_3/Widgets/home.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
  // var date = DateTime.utc(2023, 1, 2);
  // var from = DateTime.utc(date.year, 1, 1);
  // while (from.weekday != 1) {
  //   from = from.add(const Duration(days: 1));
  // }
  // final firstMondayInYear = from;

  // while (date.year == 2023) {
  //   final kw = ((date.difference(firstMondayInYear).inDays) / 7).floor() + 1;
  //   print("-------------");
  //   print("date $date");
  //   print("firstMondayInYear $firstMondayInYear");
  //   print("difference ${(date.difference(firstMondayInYear).inDays)}");
  //   print("Week: ${kw}");
  //   date = date.add(const Duration(days: 1));
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApointmentAppBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// ignore: must_be_immutable

