import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hms_patient_frontend/ui/screen/book_appointment/book_appointment.dart';
import 'package:hms_patient_frontend/ui/screen/book_appointment/doctor_detail.dart';
import 'package:hms_patient_frontend/ui/screen/book_appointment/hospitals/hospitals.dart';
import 'package:hms_patient_frontend/ui/screen/home/home.dart';
import 'package:hms_patient_frontend/ui/screen/home/home_tab.dart';

import '../infrastructure/models/doctors.dart';
import '../infrastructure/models/patient.dart';
import '../ui/screen/appointments/appointments.dart';
import '../ui/screen/auth/sign_in.dart';
import '../ui/screen/auth/register.dart';
import '../ui/screen/auth/wrapper.dart';
import '../ui/screen/book_appointment/doctors/doctor_list.dart';
import '../ui/screen/home/home_root.dart';
import '../ui/screen/profile/bills/bills.dart';
import '../ui/screen/profile/profile.dart';
import '../ui/screen/profile/reports/reports.dart';
import '../ui/screen/splashpage.dart';
part 'routes.gr.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: SplashPage, initial: true),
  AdaptiveRoute(page: AuthWrapper, children: [
    AdaptiveRoute(page: SignIn, initial: true),
    AdaptiveRoute(page: Register),
  ]),
  AdaptiveRoute(page: HomeRoot, children: [
    AdaptiveRoute(page: HomePage, initial: true, children: [
      AdaptiveRoute(
        page: HomeTab,
        // children: [

        // ]
      ),
      AdaptiveRoute(page: Profile),
      AdaptiveRoute(page: Appointments),
      // AdaptiveRoute(page: LabsAppointments),
    ]),
    AdaptiveRoute(page: HospitalsList),
    AdaptiveRoute(page: DoctorsList),
    AdaptiveRoute(page: BookAppointment),
    AdaptiveRoute(page: DoctorDetail),
    AdaptiveRoute(page: Reports),
    AdaptiveRoute(page: Bills),
  ])
])
class AppRouter extends _$AppRouter {}
