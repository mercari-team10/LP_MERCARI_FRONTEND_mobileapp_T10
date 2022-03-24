part of 'api_cubit.dart';

@freezed
abstract class ApiState with _$ApiState {
	const factory ApiState({
		required Set<API> inProgress,
		required Option<dynamic> value,
		required Option<ApiFailure> failure,
		required Option<dynamic> value2,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
		// required 
	}) = ApiConstructor;
	factory ApiState.intial() => ApiState(
		inProgress: {},
		value: none(),
		value2: none(),
		failure: none(),
		apiFailureOrSuccessOption: none());
	
  // factory ApiState.signingIn() => const ApiState(
	// 	inProgress: true, isAuthenticated: false);
  // const factory AuthState.unAuthenticated() = UnAuthenticated;
}


enum API {
  none,
	getBills,
	docAppnt,
	labAppnt,
	getReports,
	getDoctors,
	getHospitals,
	getSpecialisation
}
