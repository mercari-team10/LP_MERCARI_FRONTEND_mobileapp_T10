import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hive/hive.dart';
import 'package:hms_patient_frontend/infrastructure/models/doctors.dart';
import 'package:hms_patient_frontend/routes/routes.dart';
import 'package:intl/intl.dart' as i;

import "package:latlong2/latlong.dart" as latLng;

import '../../theme/colors.dart';
import '../../theme/style.dart';
import '../appointments/appointments.dart';
// import '../appointments/appointments.dart';

class DoctorDetailBody extends HookWidget {
  final Doctors doctors;
  const DoctorDetailBody({Key? key, required this.doctors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
		// final box = Hive.box<String>('schedules');
		// final schedules = jsonDecode(box.get(0)!) as List<Map>;
    final _date = useState(DateTime.now().millisecondsSinceEpoch);
    final _start = useState(DateTime.now().millisecondsSinceEpoch);
		
    final _datet = useState(i.DateFormat("EEEE, MMM dd").format(DateTime.now()));
    final _startt = useState(i.DateFormat("HH:mm").format(DateTime.now()));
    final _end = useState(i.DateFormat("HH:mm").format(DateTime.now().add(Duration(hours: 1))));
    return Align(
			alignment: Alignment.topLeft,
      child: Column(
			mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Align(
						alignment: Alignment.topLeft,
              child: Text(
                doctors.name,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Align(
						alignment: Alignment.topLeft,
              child: Chip(
                  labelStyle: const TextStyle(
                    color: Colors.green,
                  ),
                  backgroundColor: Colors.green[50],
                  label: Text(doctors.specialisation)),
            ),
            const SizedBox(height: 20),
            // const DoctorInfo(),
           Align(
							alignment: Alignment.topLeft,
              child: const Text('Select Date & Time',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
					const SizedBox(height: 15),
					SelectDateTime(
						_datet,
						_startt,
						_end,
						dateTime: _date,
						startTime:_start
					),
            const SizedBox(height: 20),
            Align(
								alignment: Alignment.topLeft,
												child: const Text(
															'Location',
															style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
											),
					
            const SizedBox(height: 20),
					const DoctorLocation(),
					const SizedBox(height: 10),
					ElevatedButton(
						onPressed: (){
							Map<String,dynamic> m = {
								'img': 'assets/doctor01.jpeg',
								'doctorName': doctors.name,
								'doctorTitle': doctors.specialisation,
								'reservedDate': _datet.value,
								'reservedTime': '${_startt.value} - ${_end.value}',
								'status': FilterStatus.Upcoming
							};
							schedules.add(m);
							// box.put(0, jsonEncode(schedules));
								AutoRouter.of(context).popUntilRoot();
								// ((route) => route == HomePageRoute());
		// );
						}, 
						child: const Text('Confirm',
							style: TextStyle(color:Colors.white),
						))
          ],

      ),
    );
  }
}

class SelectDateTime extends HookWidget {
	final ValueNotifier<int> dateTime;
	final ValueNotifier<String> _date;
	final ValueNotifier<String> _start;
	final ValueNotifier<String> _end;
	final ValueNotifier<int> startTime;
  const SelectDateTime(this._date, this._start, this._end, {required this.startTime, Key? key, required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _date = useState(i.DateFormat("dd-MM-yyyy").format(DateTime.now()));
    // final _start = useState(i.DateFormat("hh:mm a").format(DateTime.now()));
    // final _end = useState(i.DateFormat("hh:mm a").format(DateTime.now().add(Duration(hours: 1))));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
				mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Appointment Date'),
              TextButton.icon(
									style: ButtonStyle(
										foregroundColor: MaterialStateProperty.all(Colors.grey)
									),
                  onPressed: () async {
                    final DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().day),
                        lastDate: DateTime(DateTime.now().year + 30),
                        builder: (context, child) {
                          return child!;
                        });

                    if (date != null) {
											dateTime.value = date.millisecondsSinceEpoch;
                      _date.value = i.DateFormat("EEEE, MMM dd").format(date);
                    }
                  },
                  icon: const Icon(AntDesign.calendar),
                  label: Text(_date.value))
            ],
          ),
					// const SizedBox(height: 1,),
					Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Appointment Time'),
              TextButton.icon(
									style: ButtonStyle(
										foregroundColor: MaterialStateProperty.all(Colors.grey)
									),
                  onPressed: () async {
                    final TimeOfDay? date = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder: (context, child) {
                                      return Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: child!);
                                    });

                    if (date != null) {
											final sDate = DateTime.fromMillisecondsSinceEpoch(dateTime.value);
                      startTime.value = DateTime(
                                    sDate.year,
                                    sDate.month,
                                    sDate.day,
                                    date.hour,
                                    date.minute,
                                  ).millisecondsSinceEpoch;
                      _start.value = i.DateFormat("HH:mm").format(DateTime.fromMillisecondsSinceEpoch(startTime.value));
											_end.value = i.DateFormat("HH:mm").format(DateTime.fromMillisecondsSinceEpoch(startTime.value).add(Duration(hours: 1)));
                    }
                  },
                  icon: const Icon(AntDesign.clockcircle),
                  label: Text('${_start.value} - ${_end.value}'))
            ],
          )
        ],
      ),
    );
  }
}

class DoctorDetail extends StatelessWidget {
  final Doctors doctors;
  const DoctorDetail({Key? key, required this.doctors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // appBar: AppBar(
          //   elevation: 0,
          //   title: Text(doctors.name),
          //   centerTitle: true,
          // ),
          body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 30),
					child: DoctorDetailBody(doctors: doctors,)
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.stretch,
                //   children: [
                //     // DetailDoctorCard(),
                //     // SizedBox(
                //     //   height: 15,
                //     // ),
                //     // DoctorInfo(),
                //     // SizedBox(
                //     //   height: 30,
                //     // ),
                //     // Text(
                //     //   'About Doctor',
                //     //   style: kTitleStyle,
                //     // ),
                //     // SizedBox(
                //     //   height: 15,
                //     // ),
                //     // Text(
                //     //   'Dr. Joshua Simorangkir is a specialist in internal medicine who specialzed blah blah.',
                //     //   style: TextStyle(
                //     //     color: Color(MyColors.purple01),
                //     //     fontWeight: FontWeight.w500,
                //     //     height: 1.5,
                //     //   ),
                //     // ),
                //     // SizedBox(
                //     //   height: 25,
                //     // ),
                //     // Text(
                //     //   'Location',
                //     //   style: kTitleStyle,
                //     // ),
                //     // SizedBox(
                //     //   height: 25,
                //     // ),
                //     // DoctorLocation(),
                //     // SizedBox(
                //     //   height: 25,
                //     // ),
                //     // ElevatedButton(
                //     //   style: ButtonStyle(
                //     //     backgroundColor: MaterialStateProperty.all<Color>(
                //     //       Color(MyColors.primary),
                //     //     ),
                //     //   ),
                //     //   child: Text('Book Appointment'),
                //     //   onPressed: () => {},
                //     // )
                //   ],
                // ),
              ),
            ],
          )),
    );
  }
}

class DoctorLocation extends StatelessWidget {
  const DoctorLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(51.5, -0.09),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        NumberCard(
          label: 'Patients',
          value: '100+',
        ),
        SizedBox(width: 15),
        NumberCard(
          label: 'Experiences',
          value: '10 years',
        ),
        SizedBox(width: 15),
        NumberCard(
          label: 'Rating',
          value: '4.0',
        ),
      ],
    );
  }
}

class AboutDoctor extends StatelessWidget {
  final String title;
  final String desc;
  const AboutDoctor({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NumberCard extends StatelessWidget {
  final String label;
  final String value;

  const NumberCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(MyColors.bg03),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: Color(MyColors.grey02),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: TextStyle(
                color: Color(MyColors.header01),
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailDoctorCard extends StatelessWidget {
  const DetailDoctorCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Josua Simorangkir',
                      style: TextStyle(
                          color: Color(MyColors.header01),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Heart Specialist',
                      style: TextStyle(
                        color: Color(MyColors.grey02),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                child: Text('J'),
                radius: 100,
              )
              // Image(
              //   image: AssetImage('assets/doctor01.jpeg'),
              //   width: 100,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
