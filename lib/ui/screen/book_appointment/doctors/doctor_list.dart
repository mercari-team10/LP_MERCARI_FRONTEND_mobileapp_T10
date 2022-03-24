import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_patient_frontend/infrastructure/models/doctors.dart';
import 'package:hms_patient_frontend/infrastructure/models/hospitals.dart';
import 'package:hms_patient_frontend/providers/api/api_cubit.dart';
import 'package:hms_patient_frontend/ui/data/hospitals.dart';
import 'package:hms_patient_frontend/ui/screen/book_appointment/doctors/doctor_item.dart';
import 'package:hms_patient_frontend/ui/widgets/flush_toast.dart';
import 'package:hms_patient_frontend/ui/widgets/loaders.dart';
import '../../../widgets/no_item_tile.dart';



class DoctorsList extends StatelessWidget {
	const DoctorsList({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return BlocConsumer<ApiCubit,ApiState>(
			listenWhen: (c,p) => c.inProgress.difference(p.inProgress).contains(API.getDoctors),
			listener: (context, state) {
			  state.failure.fold(
					() {
						
					}, 
					(a) => Toast.createApiError(a).show(context)
				);
			},
			buildWhen: (c,p) => c.inProgress.difference(p.inProgress).contains(API.getDoctors),
			builder: (context, state) {
				final List<Doctors> doctors = d.map((e) => Doctors.fromMap(e)).toList();
				state.value.fold(
					() => [],
					(r) {
							try {
								return r as List<Doctors>;
							} catch (e) {
								return [];
							}
						});
				return Scaffold(
					body: state.inProgress.contains(API.getDoctors)?
					const InfiniteLoader()
				: doctors.isEmpty?
					const NoItemTile(value: 'No Doctors found!')
				:ListView.builder(
					itemCount: doctors.length,
					itemBuilder: (context, index) {
					  return DoctorItems(doctors: doctors[index]);
					},
				),
				);
			},
		);
	}
}