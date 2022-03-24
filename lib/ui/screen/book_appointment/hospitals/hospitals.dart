import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_patient_frontend/infrastructure/models/hospitals.dart';
import 'package:hms_patient_frontend/providers/api/api_cubit.dart';
import 'package:hms_patient_frontend/ui/widgets/flush_toast.dart';
import 'package:hms_patient_frontend/ui/widgets/loaders.dart';
import '../../../widgets/no_item_tile.dart';
import 'hospitalItems.dart';

class HospitalsList extends StatelessWidget {
	const HospitalsList({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return BlocConsumer<ApiCubit,ApiState>(
			listenWhen: (c,p) => c.inProgress.difference(p.inProgress).contains(API.getHospitals),
			listener: (context, state) {
			  state.failure.fold(
					() {
						
					}, 
					(a) => Toast.createApiError(a).show(context)
				);
			},
			buildWhen: (c,p) => c.inProgress.difference(p.inProgress).contains(API.getHospitals),
			builder: (context, state) {
				final List<Hospitals> hospitals = state.value2.fold(
					() => [],
					(r) {
							try {
								return r as List<Hospitals>;
							} catch (e) {
								return [];
							}
						});
				return state.inProgress.contains(API.getHospitals)?
					const InfiniteLoader()
				: hospitals.isEmpty?
					const NoItemTile(value: 'No Hospitals found!')
				:ListView.builder(
					itemCount: hospitals.length,
					itemBuilder: (context, index) {
						if(index == 0){
							return Column(
							  children: [
									state.value.fold(
										() => Container(), 
										(s) => Row(
											children: [
												const Text('Suggested Filters: '),
												const SizedBox(width: 10,),
												InkWell(
													onTap: () async{
														await context.read<ApiCubit>().getHospitals(specialisation: s);
													},
													child: Chip(label: Text('$s'))
												)
											],
										),
									),
							    HospitalItems(hospitals: hospitals[index],
										specialisation: state.value.getOrElse(() => '')
									),
							  ],
							);
						}
					  return HospitalItems(hospitals: hospitals[index],
										specialisation: state.value.getOrElse(() => ''));
					},
				);
			},
		);
	}
}