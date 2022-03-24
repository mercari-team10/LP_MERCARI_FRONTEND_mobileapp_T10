import 'package:auto_route/auto_route.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hms_patient_frontend/infrastructure/models/doctors.dart';
import 'package:hms_patient_frontend/routes/routes.dart';


class DoctorItems extends StatelessWidget {
	final Doctors doctors;
	const DoctorItems({ Key? key, 
		required this.doctors }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return CupertinoListTile(
			// leading: ,
			title: Text(doctors.name),
			subtitle: Text(doctors.specialisation),
			onTap: (){
				context.router.push(DoctorDetailRoute(doctors: doctors));
			},
		);
	}
}