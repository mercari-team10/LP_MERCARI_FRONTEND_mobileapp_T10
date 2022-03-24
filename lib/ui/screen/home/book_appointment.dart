

import 'package:auto_route/auto_route.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hms_patient_frontend/infrastructure/models/doctors.dart';
import 'package:hms_patient_frontend/routes/routes.dart';

import '../../data/symptoms.dart';




class BookAppointment extends HookWidget {

	const BookAppointment({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final selectedSympoms = useState(<String>[]);	
		// useEffect((){
			void openFilterDialog() async {
				await FilterListDialog.display<String>(
					context,
					listData: symptoms,
					controlButtons: [],
					selectedListData: selectedSympoms.value,
					choiceChipLabel: (s) => s,
					validateSelectedItem: (list, val) => list!.contains(val),
					onItemSearch: (s, query) {
						return s.toLowerCase().contains(query.toLowerCase());
					},
					hideCloseIcon: true,
					onApplyButtonClick: (list) {
							selectedSympoms.value = List.from(list!);
							
							// AutoRouter.of(context).popAndPush( BookAppointmentRoute(symptoms: selectedSympoms.value));
							AutoRouter.of(context).popAndPush( DoctorsListRoute());
						// Navigator.pop(context);
						// print(context.router.stack);
						// context.router.pushAll([
						// 	const HomeTabRoute(),
						// 	const BookAppointmentRoute()
						// ]);
					},
				);
			}
		// 	openFilterDialog();
		// },[]);

		return Card(
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(10)
			),
			// margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
			color: Colors.redAccent,
			child: Container(
			  padding: const EdgeInsets.fromLTRB(22, 22, 22, 10),
				height: MediaQuery.of(context).size.height*0.25,
			  child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
			  	children: [
			  		const Text('Book Apppointment',
			  			style: TextStyle(fontSize: 20, 
			  				fontWeight: FontWeight.bold,
								color: Colors.white
			  			),
			  		),
			  		const SizedBox(height: 35),
			  		const AutoSizeText(
			  			"Don't have time for waiting? You are just few clicks away. Book your time now. We will wait for you.",
			  			maxLines: 3,
							style: TextStyle(
								fontSize: 8,
								color: Colors.white
							),
							// maxFontSize: 10,
			  		),
						const SizedBox(height:15),
			  		ElevatedButton(
							style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),		
			  			onPressed: () {
								// final v = context.router;
								// print(v);
							openFilterDialog();
							// AutoRouter.of(context).push(DoctorDetailRoute(doctors: Doctors(
							// 	name: 'Dr. Gardner Pearson', 
							// 	docId: 'sdbfhjsbbjdbjhbs', specialisation: 'Heart Specialist')));
							}, 

							// print(),
			  			child: Padding(
			  			  padding: const EdgeInsets.only(left: 0.0, right: 0),
			  			  child: Row(
									mainAxisSize: MainAxisSize.min,
			  			  	children: const [
			  			  		Text('Book Now',
											style: TextStyle(
												color: Colors.black
											),
										),
			  			  		SizedBox(width: 8,),
			  			  		Icon(AntDesign.checkcircle
											,size: 14,
											color: Colors.black,
										)
			  			  	],
			  			  ),
			  			))
			  	],
			  ),
			)
		);
	}
}