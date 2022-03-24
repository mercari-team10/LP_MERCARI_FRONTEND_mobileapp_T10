import 'package:dartz/dartz.dart';
import 'package:hms_patient_frontend/infrastructure/models/patient.dart';
import '../failures/auth_failure.dart';

// Firebase Auth

abstract class AuthInterface {
  Future<Either<AuthFailure, Unit>> register({
    required Patient patient, required String password
  });

  Future<Either<AuthFailure, Patient>> signIn({
    required String password,
    required String username,
  });
	Option<Patient> getCurrentUser();

	// Future<Either<AuthFailure, Unit>> sendOTP();
	// Future<Either<AuthFailure, Unit>> resetPassword({
  //   required String nhid,
  // });
	Future<void> signOut();
}