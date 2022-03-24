import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hms_patient_frontend/infrastructure/api/api_endpoints.dart';
import 'package:hms_patient_frontend/infrastructure/failures/api_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:hms_patient_frontend/infrastructure/interfaces/api_inteface.dart';
import 'package:hms_patient_frontend/infrastructure/models/appointment.dart';
import 'package:hms_patient_frontend/infrastructure/models/bills.dart';
import 'package:hms_patient_frontend/infrastructure/models/params.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../models/doctors.dart';
import '../models/hospitals.dart';
import '../models/reports.dart';
import '../schema.dart';

@LazySingleton(as: ApiInterface)
class ApiImplementation extends ApiInterface {
  final _schema = Schema();

  static Future<Response> apiConstructor({
    required String url,
    required bool isPost,
    String? body,
    bool hasNoTimeLimit = false,
  }) async {
    const Map<String, String> headers = {"Content-type": "application/json"};
    try {
      final Response res = isPost
          ? await post(Uri.parse(url), headers: headers, body: body)
          : await get(Uri.parse(url));
      log('RESPONSE STATUSCODE from $url : ${res.statusCode}');
      // print('RESPONSE BODY from $url : ${res.body}');
      if (res.statusCode == 200) {
        if (res.body.isNotEmpty == true) {
          return res;
        } else {
          throw const ApiFailure.failTofetchRequest();
        }
      }
      if ((res.statusCode / 100).floor() == 5) {
        throw const ApiFailure.serverError();
      }
      if ((res.statusCode / 100).floor() == 4) {
        throw const ApiFailure.unknownError();
      }
      throw const ApiFailure.errorWhileMakingRequest();
    } on TimeoutException {
      throw const ApiFailure.failTofetchRequest();
    } on SocketException {
      throw const ApiFailure.noInternet();
    } on ApiFailure {
      rethrow;
    } catch (e) {
      log('ERROR IN APICALL : $e');
      throw const ApiFailure.unknownError();
    }
  }

  @override
  Future<Either<ApiFailure, bool>> checkAvailable(
      {	required Params params
			// 	required String nhid,
      // required String hospId,
      // required String docId,
      // required int start,
      // required int duration
			}) {
    // TODO: implement checkAvailable
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiFailure, List<Appointment>>> docAppnt({
		required Params params
			// required String nhid,
      // required String hospId,
      // required String docId,
      // required int start,
      // required int endtime,
      // required String symptoms
			}) async {
    await apiConstructor(
      isPost: true,
      url: ApiEndpoints.docAppnt,
    );
    // return right(unit);
		throw UnimplementedError();
  }

  @override
  Future<Either<ApiFailure, List<Bills>>> getBills({
		required String nhid}) async{
    try {
			final url = ApiEndpoints.getBills+  '?${_schema.nhid}=$nhid';
				final res = await apiConstructor(
					url: url, 
					isPost: false
				);
				final bills = (jsonDecode(res.body) as List).map((e) => Bills.fromMap(e)).toList();
				return right(bills);
		}on ApiFailure catch (e) {
			return left(e);
		}
		// throw UnimplementedError();
  }

  @override
  Future<Either<ApiFailure, List<Doctors>>> getDoctors({
		required String hosptId,
		required String specialisation
	}) async{
		try {
			final url = 
				specialisation.isEmpty?
				ApiEndpoints.getDoctors + '?hosptId=$hosptId'
				: ApiEndpoints.getDoctors + '?hosptId=$hosptId&specialisation=$specialisation';
			final res = await apiConstructor(
				url: url, 
				isPost: false,);
			final list = (jsonDecode(res.body) as List).map((e) => Doctors.fromMap(e)).toList();
			return right(list);
		} on ApiFailure catch (e) {
			return left(e);
		}
	}

  @override
  Future<Either<ApiFailure, List<Reports>>> getReports({required String nhid}) async{
    try {
			final url = ApiEndpoints.getReports+  '?${_schema.nhid}=$nhid';
				final res = await apiConstructor(
					url: url, 
					isPost: false
				);
				final reports = (jsonDecode(res.body) as List).map((e) => Reports.fromMap(e)).toList();
				return right(reports);
		}on ApiFailure catch (e) {
			return left(e);
		}
  }

  @override
  Future<Either<ApiFailure, List<Appointment>>> labAppnt(
      {	required Params params
			}) async{
    try {
			// final url = ApiEndpoints.getBills+  '?${_schema.nhid}=$nhid';
				final res = await apiConstructor(
					url: ApiEndpoints.labAppnt, 
					isPost: false,
					body: params.toJson()
				);
				// List
				// final labappnt = (jsonDecode(res.body) as List).map((e) => Appointment.fromMap(e)).toList();
				return right([]);
		}on ApiFailure catch (e) {
			return left(e);
		}
  }

  @override
  Future<Either<ApiFailure, List<Hospitals>>> getHospitals({
		required String specialisation}) async{
		try {
			final url = 
				specialisation.isEmpty?
				ApiEndpoints.getHospitals
				: ApiEndpoints.getHospitals + '?specialisation=$specialisation';
			final res = await apiConstructor(
				url: url, 
				isPost: false,);
			final list = (jsonDecode(res.body) as List).map((e) => Hospitals.fromMap(e)).toList();
			return right(list);
		} on ApiFailure catch (e) {
			return left(e);
		}
  }

  @override
  Future<Either<ApiFailure, String>> getSpecialisation({
		required String symptoms}) async{
		try {
			final url = ApiEndpoints.getSpecialisation + '?symptoms=$symptoms';
			final res = await apiConstructor(
				url: url, 
				isPost: false,);
			return right(res.body);
		} on ApiFailure catch (e) {
			return left(e);
		}
  }
	
}
