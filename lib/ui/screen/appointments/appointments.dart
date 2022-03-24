import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/style.dart';

class Appointments extends StatelessWidget {
	const Appointments({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return const ScheduleTab();
	}
}

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({Key? key}) : super(key: key);

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

enum FilterStatus { Upcoming, Complete }

List<Map> schedules = [
  {
    'img': 'assets/doctor01.jpeg',
    'doctorName': 'Dr. Anastasya Sahid',
    'doctorTitle': 'Dental Specialist',
    'reservedDate': 'Friday, Mar 25',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Upcoming
  },
  // {
  //   'img': 'assets/doctor02.png',
  //   'doctorName': 'Dr. Mauldya Imran',
  //   'doctorTitle': 'Skin Specialist',
  //   'reservedDate': 'Monday, Sep 29',
  //   'reservedTime': '11:00 - 12:00',
  //   'status': FilterStatus.Upcoming
  // },
  // {
  //   'img': 'assets/doctor03.jpeg',
  //   'doctorName': 'Dr. Rihanna Garland',
  //   'doctorTitle': 'General Specialist',
  //   'reservedDate': 'Monday, Jul 29',
  //   'reservedTime': '11:00 - 12:00',
  //   'status': FilterStatus.Upcoming
  // },
  {
    'img': 'assets/doctor04.jpeg',
    'doctorName': 'Dr. John Doe',
    'doctorTitle': 'Skin Specialist',
    'reservedDate': 'Monday, Apr 4',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Upcoming
  },
  {
    'img': 'assets/doctor05.jpeg',
    'doctorName': 'Dr. Anastasya Sahid',
    'doctorTitle': 'Detalist Specialist',
    'reservedDate': 'Tueday, Mar 22',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Complete
  },
  // {
  //   'img': 'assets/doctor05.jpeg',
  //   'doctorName': 'Dr. Sam Smithh',
  //   'doctorTitle': 'Other Specialist',
  //   'reservedDate': 'Monday, Jul 29',
  //   'reservedTime': '11:00 - 12:00',
  //   'status': FilterStatus.Cancel
  // },
];

class _ScheduleTabState extends State<ScheduleTab> {
  FilterStatus status = FilterStatus.Upcoming;
  // Alignment _alignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    List<Map> filteredSchedules = schedules.where((var schedule) {
      return schedule['status'] == status;
    }).toList();

    return Scaffold(
			// appBar: AppBar(
			// 	title: Text(
      //         'Schedule',
      //       ),
			// 	elevation: 0,
			// 	centerTitle: true,
			// 	titleTextStyle: kTitleStyle.copyWith(fontSize: 18),
 			// 	// bottom: TabBar(isScrollable: true, tabs: [
      // //       Tab(
      // //           child: SizedBox(
      // //           child: Center(
      // //               child: Text(
      // //             'Doctor Appointments',
      // //           )),
      // //         )),
			// 	// 			Tab(
      // //           child: SizedBox(
      // //           child: Center(
      // //               child: Text(
      // //             'Lab Appointments',
      // //           )),
      // //         )),
      // //     ])
			// 	),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Schedule',
              textAlign: TextAlign.center,
              style: kTitleStyle,
            ),
            SizedBox(
              height: 20,
            ),
            // Stack(
            //   children: [
            //     Container(
            //       width: double.infinity,
            //       height: 40,
            //       decoration: BoxDecoration(
            //         color: Color(MyColors.bg),
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           for (FilterStatus filterStatus in FilterStatus.values)
            //             Expanded(
            //               child: GestureDetector(
            //                 onTap: () {
            //                   setState(() {
            //                     if (filterStatus == FilterStatus.Upcoming) {
            //                       status = FilterStatus.Upcoming;
            //                       _alignment = Alignment.centerLeft;
            //                     } else if (filterStatus ==
            //                         FilterStatus.Complete) {
            //                       status = FilterStatus.Complete;
            //                       _alignment = Alignment.centerRight;
            //                     } 
            //                   });
            //                 },
            //                 child: Center(
            //                   child: Text(
            //                     filterStatus.name,
            //                     style: kFilterStyle,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //         ],
            //       ),
            //     ),
            //     AnimatedAlign(
            //       duration: Duration(milliseconds: 200),
            //       alignment: _alignment,
            //       child: Container(
            //         width: 100,
            //         height: 40,
            //         decoration: BoxDecoration(
            //           color: Color(MyColors.primary),
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //         child: Center(
            //           child: Text(
            //             status.name,
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: (context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    margin: !isLastElement
                        ? EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              // CircleAvatar(

                              //   // backgroundImage: AssetImage(_schedule['img']),
                              // ),
                              // SizedBox(
                              //   width: 10,
                              // ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _schedule['doctorName'],
                                    style: TextStyle(
                                      color: Color(MyColors.header01),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _schedule['doctorTitle'],
                                    style: TextStyle(
                                      color: Color(MyColors.grey02),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DateTimeCard(_schedule),
                          SizedBox(
                            height: 15,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Expanded(
                          //       child: OutlinedButton(
                          //         child: Text('Cancel'),
                          //         onPressed: () {},
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: 20,
                          //     ),
                          //     Expanded(
                          //       child: ElevatedButton(
                          //         child: Text('Reschedule'),
                          //         onPressed: () => {},
                          //       ),
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DateTimeCard extends StatelessWidget {
	final Map<dynamic, dynamic> _schedule;
  const DateTimeCard(this._schedule,{
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.bg03),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Color(MyColors.primary),
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                _schedule['reservedDate'],
                style: TextStyle(
                  fontSize: 12,
                  color: Color(MyColors.primary),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.access_alarm,
                color: Color(MyColors.primary),
                size: 17,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                _schedule['reservedTime'],
                style: TextStyle(
                  color: Color(MyColors.primary),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}