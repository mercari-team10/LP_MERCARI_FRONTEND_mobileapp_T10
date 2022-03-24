import 'package:flutter/material.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hms_patient_frontend/providers/auth/auth_cubit.dart';
import 'package:hms_patient_frontend/ui/widgets/no_item_tile.dart';

import '../../../providers/api/api_cubit.dart';
import 'hospitals/hospitals.dart';



// List<String> symptoms = [
// 	'jaundice',
// 	'maalaria0',
// 	'yeloow feveer',
// 	'fever',
// 	'headache',
// 	'pain',
// 	'back pain',
// 	'eye pain',
// 	'hand pain',
// 	'neck pain',
// 	'sprain',
// 	'abbrassion'
// ];


class BookAppointment extends HookWidget {
	final List<String> symptoms;
	const BookAppointment({ Key? key, this.symptoms = const[], }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		// final selectedSympoms = useState(<String>[]);	
		useEffect((){
			context.read<ApiCubit>().getSpecialisation(
				symptoms: symptoms.join(',')
			);
			context.read<ApiCubit>().getHospitals(specialisation: '');
			return;
		},[]);
		// useEffect((){
		// 	void openFilterDialog() async {
		// 		await FilterListDialog.display<String>(
		// 			context,
		// 			listData: symptoms,
		// 			selectedListData: selectedSympoms.value,
		// 			choiceChipLabel: (s) => s,
		// 			validateSelectedItem: (list, val) => list!.contains(val),
		// 			onItemSearch: (s, query) {
		// 				return s.toLowerCase().contains(query.toLowerCase());
		// 			},
		// 			onApplyButtonClick: (list) {
		// 					selectedSympoms.value = List.from(list!);
		// 				Navigator.pop(context);
		// 			},
		// 		);
		// 	}
		// 	openFilterDialog();
		// },[]);

		return Scaffold(
			appBar: AppBar(
				title: const Text('Book Your Appointment',
					style: TextStyle(
						color: Colors.black
					),
				),
				elevation: 0,
			),
			body: const HospitalsList()
		);

	}

	
}