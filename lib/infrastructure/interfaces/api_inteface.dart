import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:hms_patient_frontend/infrastructure/models/bills.dart';
import 'package:hms_patient_frontend/infrastructure/models/params.dart';
import 'package:hms_patient_frontend/infrastructure/models/reports.dart';

import '../failures/api_failure.dart';
import '../models/appointment.dart';
import '../models/doctors.dart';
import '../models/hospitals.dart';

abstract class ApiInterface{
	/// Calendar Microservice
	Future<Either<ApiFailure, bool>> checkAvailable({
		// required String nhid,
		// required String hospId,
		// required String docId,
		// required int start,
		// required int duration,
		required Params params,
	});
	Future<Either<ApiFailure, List<Appointment>>> docAppnt({
		// required String nhid,
		// required String hospId,
		// required String docId,
		// required int start,
		// required int endtime,
		// required String symptoms,
		required Params params,
		// required String d,
	});
	Future<Either<ApiFailure, List<Appointment>>> labAppnt({
		// required String nhid,
		// required String hospId,
		// required String labId,
		// required String testId,
		required Params params,
	});
	Future<Either<ApiFailure, List<Doctors>>> getDoctors({
		required String hosptId,
		required String specialisation
	});

	Future<Either<ApiFailure, List<Hospitals>>> getHospitals({
		required String specialisation
	});
	Future<Either<ApiFailure, String>> getSpecialisation({
		required String symptoms
	});

	Future<Either<ApiFailure, List<Bills>>> getBills({
		required String nhid,
	});
	
	Future<Either<ApiFailure, List<Reports>>> getReports({
		required String nhid,
	});
}