import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:hms_patient_frontend/infrastructure/failures/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:hms_patient_frontend/infrastructure/interfaces/auth_interface.dart';
import 'package:hms_patient_frontend/infrastructure/models/patient.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import 'auth_endpoints.dart';
import 'package:hms_patient_frontend/infrastructure/extensions.dart';



@LazySingleton(as: AuthInterface)
class AuthImplementation extends AuthInterface {


	static Future<Response> authConstructor({
    required String url,
    required bool isPost,
    String? body,
    bool hasNoTimeLimit = false,
  }) async {
    const Map<String, String> headers = {"Content-type": "application/json"};
    try {
			log('$body', name: 'AUTH');
      final Response res = isPost
          ? await post(Uri.parse(url), headers: headers, body: body)
          : await get(Uri.parse(url));
      log('RESPONSE STATUSCODE from $url : ${res.statusCode}');
      log('RESPONSE BODY from $url : ${res.body}');
      if (res.statusCode == 200) {
        if (res.body.isNotEmpty == true) {
          return res;
        } else {
          throw const AuthFailure.errorWhileMakingRequest();
        }
      }
      if ((res.statusCode / 100).floor() == 5) {
        throw const AuthFailure.serverError();
      }
      if ((res.statusCode / 100).floor() == 4) {
        throw const AuthFailure.unknownError();
      }
      throw const AuthFailure.errorWhileMakingRequest();
    } on TimeoutException {
      throw const AuthFailure.errorWhileMakingRequest();
    } on SocketException {
      throw const AuthFailure.noInternet();
    } on AuthFailure {
      rethrow;
    } catch (e) {
      log('ERROR IN AUTHCALL : $e');
      throw const AuthFailure.unknownError();
    }
  }

  @override
  Option<Patient> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, Unit>> register({
		required Patient patient, required String password}) async{
		try{
			await authConstructor(
				url: AuthEndpoints.register, 
				isPost: true,
				body: patient.toMap().putOrUpdate("password", ()=> password).toJson
			);
			return right(unit);
		}on AuthFailure catch (e ){
			return left(e);
		}
  }

  @override
  Future<Either<AuthFailure, Patient>> signIn({
		required String password, required String username}) async{
    try{
			final map = {
				"password": password,
				"username": username,
			};
			final res = await authConstructor(
				url: AuthEndpoints.login, 
				isPost: true,
				body: map.toJson
			);
			final patient = Patient.fromJson(res.body);
			return right(patient);
		}on AuthFailure catch (e ){
			return left(e);
		}
  }

  @override
  Future<void> signOut() async{
		// TODO: add signout
		return Future.value();
  }

}