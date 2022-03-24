import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_patient_frontend/infrastructure/interfaces/api_inteface.dart';
import 'package:hms_patient_frontend/infrastructure/models/params.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';

import '../../infrastructure/failures/api_failure.dart';
part 'api_state.dart';
part 'api_cubit.freezed.dart';

@injectable
class ApiCubit extends Cubit<ApiState> {
	final ApiInterface _api;
  ApiCubit(this._api) : super(ApiState.intial());

	// final 
	Future<void> loadApp(){
		return Future.value();
		// throw UnimplementedError();
	}

	Future<void> getBills({required String nhid})async{
		emit(ApiState.intial().copyWith(
			inProgress: state.inProgress.union({API.getBills})
		));
		final res = await _api.getBills(nhid: nhid);
		emit(state.copyWith(
				inProgress: state.inProgress.difference({API.getBills}),
				apiFailureOrSuccessOption: some(res)));

	}

	Future<void> docAppnt({required Params p}) async{
		emit(ApiState.intial().copyWith(
			inProgress: state.inProgress.union({API.docAppnt})
		));
		final res = await _api.docAppnt(params: p);
		emit(state.copyWith(
				inProgress: state.inProgress.difference({API.docAppnt}),
				apiFailureOrSuccessOption: some(res)));
	}

	Future<void> labAppnt({required Params p}) async{
		emit(ApiState.intial().copyWith(
			inProgress: state.inProgress.union({API.labAppnt})
		));
		final res = await _api.labAppnt(params: p);
		emit(state.copyWith(
				inProgress: state.inProgress.difference({API.labAppnt}),
				apiFailureOrSuccessOption: some(res)));
	}

	Future<void> getReports({required String nhid}) async{
		emit(ApiState.intial().copyWith(
			inProgress: state.inProgress.union({API.getReports})
		));
		final res = await _api.getReports(nhid: nhid);
		emit(state.copyWith(
				inProgress: state.inProgress.difference({API.getReports}),
				apiFailureOrSuccessOption: some(res)));
	}
	Future<void> getDoctors({required String hosptId,
		required String specialisation
	}) async{
		emit(ApiState.intial().copyWith(
			inProgress: state.inProgress.union({API.getDoctors}),
			value: state.value
		));
		final res = await _api.getDoctors(hosptId: hosptId,
			specialisation: specialisation
		);
		res.fold(
			(l) => state.copyWith(
				inProgress: state.inProgress.difference({API.getDoctors}),
				failure: some(l)
			), 
			(d) => emit(state.copyWith(
			inProgress: state.inProgress.difference({API.getDoctors}),
				value: some(d))));
		
	}

	Future<void> getSpecialisation({required String symptoms}) async {
		emit(ApiState.intial().copyWith(
			inProgress: state.inProgress.union({API.getSpecialisation})
		));
		final spzl = await _api.getSpecialisation(symptoms: symptoms);
		spzl.fold(
			(l) => emit(state.copyWith(
				inProgress: state.inProgress.difference({API.getSpecialisation}),
				failure: some(l))), 
			(s) {
				emit(state.copyWith(
							inProgress: state.inProgress.difference({API.getSpecialisation}),
							value: some(s)));
						}
		);
		
	}

	Future<void> getHospitals({required String specialisation}) async {
		emit(ApiState.intial().copyWith(
			inProgress: state.inProgress.union({API.getHospitals}),
			value: state.value
		));
		final res = await _api.getHospitals(specialisation: specialisation);
		res.fold(
			(l) => state.copyWith(
				inProgress: state.inProgress.difference({API.getHospitals}),
				failure: some(l)
			), 
			(h) => emit(state.copyWith(
			inProgress: state.inProgress.difference({API.getHospitals}),
				value2: some(h))));
		
	}

}