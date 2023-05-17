import 'package:flutter/material.dart';
import 'package:flutter_application_3/bloc/apointment_app_bloc.dart';
import 'package:flutter_application_3/globals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeViewButton extends StatelessWidget {
  const ChangeViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApointmentAppBloc, ApointmentAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                BlocProvider.of<ApointmentAppBloc>(context).add(ChangeViewEvent());
              },
              icon: Icon(Icons.refresh)),
        );
      },
    );
  }
}
