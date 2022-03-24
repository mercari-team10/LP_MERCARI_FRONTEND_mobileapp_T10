part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
	const factory AuthState({
		required bool inProgress,
		required bool isAuthenticated,
		required Option<AuthFailure> authFailure,
		required Option<Patient> patient,
	}) = _AuthConstructor;
	factory AuthState.initial() => AuthState(
		inProgress: false, 
		authFailure: none(),
		isAuthenticated: false,
		patient: none()	
	);
	
  factory AuthState.status() => AuthState(
		inProgress: true, 
		authFailure: none(),
		isAuthenticated: false,
		patient: none()	
	);
	
	factory AuthState.signedIn({required Patient patient}) => AuthState(
		inProgress: false,
		authFailure: none(),
		patient: some(patient),
		isAuthenticated: true);
  // const factory AuthState.unAuthenticated() = UnAuthenticated;
}

// enum 7