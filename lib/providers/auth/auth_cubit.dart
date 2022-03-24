import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hms_patient_frontend/infrastructure/interfaces/auth_interface.dart';
import 'package:hms_patient_frontend/infrastructure/models/patient.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../infrastructure/failures/auth_failure.dart';
part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
	final AuthInterface _authInterface;
  AuthCubit(this._authInterface) : super(AuthState.initial());

	// final 
	Future<void> registerUser({
		required Patient patient,
		required String password
	})async{
		emit(AuthState.status());
		final box = Hive.box<bool>('user');
		final res = await _authInterface.register(
			password: password,
			patient: patient);
		res.fold(
			(l) {
				emit(AuthState.initial().copyWith(
					authFailure: some(l)
				));
				box.put(0, false);	
			},
			(r) {
				emit(AuthState.signedIn(patient: patient));
				box.put(0, false);
			});
	}

	Future<void> signInUser({
		required String username, required String password
	})async{
		emit(AuthState.status());
		final box = Hive.box<bool>('user');
		final res = await _authInterface.signIn(
			username: username,password: password);
		res.fold(
			(l) {
				emit(AuthState.initial().copyWith(
					authFailure: some(l)
				));
				box.put(0, false);	
			},
			(r) {
				emit(AuthState.signedIn(patient: r));
				box.put(0, false);
			});
	}

	Future<void> authCheckRequested()async{
		emit(AuthState.status());
		final box = Hive.box<bool>('user');
		Future.delayed(const Duration(seconds: 1), () => emit(AuthState.initial().copyWith(isAuthenticated: box.get(0, defaultValue: false)!)));
	}

	Future<void> signOut()async{
		emit(AuthState.status());
		final box = Hive.box<bool>('user');
		box.put(0, false);
		emit(AuthState.initial());
	}

}