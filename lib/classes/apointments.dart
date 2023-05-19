class Apointments {
  DateTime apointmentstart;
  String tittle;
  int dauer;
  String place;
  bool active = true;
  List<Allarm>? alarms;
  int prioritate;
  Apointments({
    required this.apointmentstart,
    required this.tittle,
    required this.dauer,
    required this.place,
    required this.prioritate,
  });

  void display(){
    print('$tittle , $place');
  }
}

class Allarm {}
