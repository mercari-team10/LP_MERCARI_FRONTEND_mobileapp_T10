import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hms_patient_frontend/infrastructure/models/patient.dart';
import 'package:hms_patient_frontend/routes/routes.dart';
import 'package:hms_patient_frontend/ui/widgets/custom_scaffold.dart';
import 'package:provider/provider.dart';

import '../../theme/colors.dart';
import '../../theme/style.dart';
import '../appointments/appointments.dart';
import 'book_appointment.dart';



class HomeTab extends StatelessWidget {
	const HomeTab({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return SafeArea(
		  child: GestureDetector(
		  	onTap: () => FocusScope.of(context).unfocus(),
		  	child: ListView(
		  	padding: const EdgeInsets.symmetric(horizontal: 30),
		  	  children: [
		  	    const SizedBox(
		  	      height: 30,
		  	    ),
		  	    const UserIntro(),
		  	    // const SizedBox(
		  	    //   height: 10,
		  	    // ),
		  	    // const SearchInput(),
		  	    const SizedBox(
		  	      height: 50,
		  	    ),
		  	    // const CategoryIcons(),
		  	    // SizedBox(
		  	    //   height: 20,
		  	    // ),
		  	    Row(
		  	      mainAxisAlignment: MainAxisAlignment.spaceBetween,
		  	      children: [
		  	        Text(
		  	          'Appointment Today',
		  	          style: kTitleStyle,
		  	        ),
		  	        TextButton(
		  	          child: Text(
		  	            'See All',
		  	            style: TextStyle(
		  	              color: Color(MyColors.yellow01),
		  	              fontWeight: FontWeight.bold,
		  	            ),
		  	          ),
		  	          onPressed: () {
										AutoTabsRouter.of(context).setActiveIndex(1);
									},
		  	        )
		  	      ],
		  	    ),
		  	    const SizedBox(
		  	      height: 20,
		  	    ),
		  	    AppointmentCard(
		  	      onTap: (){},
		  	    ),
		  	    const SizedBox(
		  	      height: 20,
		  	    ),
		  	    // Text(
		  	    //   'Top Doctor',
		  	    //   style: TextStyle(
		  	    //     color: Color(MyColors.header01),
		  	    //     fontWeight: FontWeight.bold,
		  	    //   ),
		  	    // ),
		  	    const SizedBox(
		  	      height: 20,
		  	    ),
						const BookAppointment()
		  	    // for (var doctor in doctors)
		  	    //   TopDoctorCard(
		  	    //     img: doctor['img'],
		  	    //     doctorName: doctor['doctorName'],
		  	    //     doctorTitle: doctor['doctorTitle'],
		  	    //   )
		  	  ],
		  	),
		  ),
		);
	}
}

class TopDoctorCard extends StatelessWidget {
  String img;
  String doctorName;
  String doctorTitle;

  TopDoctorCard({
    required this.img,
    required this.doctorName,
    required this.doctorTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(context, '/detail');
        },
        child: Row(
          children: [
            Container(
              color: Color(MyColors.grey01),
              // child: Image(
                // width: 100,
                // image: AssetImage(img),
              // ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: TextStyle(
                    color: Color(MyColors.header01),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  doctorTitle,
                  style: TextStyle(
                    color: Color(MyColors.grey02),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(MyColors.yellow02),
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '4.0 - 50 Reviews',
                      style: TextStyle(color: Color(MyColors.grey02)),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final void Function() onTap;

  const AppointmentCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(MyColors.primary),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
													child: Icon(
														Icons.apps_outage
													),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(schedules.first['doctorName'],
                                style: TextStyle(color: Colors.white)),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              schedules.first['doctorTitle'],
                              style: TextStyle(color: Color(MyColors.text01)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ScheduleCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(MyColors.bg02),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(MyColors.bg03),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

List<Map> categories = [
  {'icon': Icons.coronavirus, 'text': 'Covid 19'},
  {'icon': Icons.local_hospital, 'text': 'Hospital'},
  {'icon': Icons.car_rental, 'text': 'Ambulance'},
  {'icon': Icons.local_pharmacy, 'text': 'Pill'},
];

class CategoryIcons extends StatelessWidget {
  const CategoryIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var category in categories)
          CategoryIcon(
            icon: category['icon'],
            text: category['text'],
          ),
      ],
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
			stream: Stream.periodic(Duration(microseconds: 10)),
        // valueListenable: Hive.box<String>('schedules').listenable(keys: [0]),
      builder: (context, _) {
				// final schedules = jsonDecode(value.get(0)!) as List<Map>;
        return Container(
          decoration: BoxDecoration(
            color: Color(MyColors.bg01),
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.calendar_today,
                color: Colors.white,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                schedules.first['reservedDate'],
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.access_alarm,
                color: Colors.white,
                size: 17,
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                child: Text(
                  schedules.first['reservedTime'],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

class CategoryIcon extends StatelessWidget {
  IconData icon;
  String text;

  CategoryIcon({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(MyColors.bg01),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(MyColors.bg),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                icon,
                color: Color(MyColors.primary),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: Color(MyColors.primary),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(MyColors.bg),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search,
              color: Color(MyColors.purple02),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search a doctor or health issue',
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(MyColors.purple01),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserIntro extends StatelessWidget {
  const UserIntro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              context.read<Patient>().name + ' 👋',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        CircleAvatar(
					child: Text(
						context.read<Patient>().name[0],
						style: const TextStyle(
							fontWeight: FontWeight.bold
						),
					),
          // backgroundImage: AssetImage('assets/person.jpeg'),
        )
      ],
    );
  }
}