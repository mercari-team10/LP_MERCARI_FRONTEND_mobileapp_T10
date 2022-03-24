import 'package:auto_route/auto_route.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_patient_frontend/infrastructure/models/hospitals.dart';
import 'package:hms_patient_frontend/ui/widgets/flush_toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../providers/api/api_cubit.dart';


class HospitalItems extends StatelessWidget {
	final Hospitals hospitals;
	final String? specialisation;
	const HospitalItems({ Key? key, 
		required this.hospitals, this.specialisation }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return CupertinoListTile(
			// leading: ,
			title: Text(hospitals.name),
			subtitle: Text(hospitals.address),
			onTap: (){
				context.read<ApiCubit>().getDoctors(
					hosptId: hospitals.hosptId,
					specialisation: specialisation??''
				);
				// context.router.push(const Doctors());
			},
			trailing: IconButton(
				onPressed: (){
					launchCaller(hospitals.phone, context);
				},
				icon: const Icon(Icons.phone),
			),
		);
	}
}

Future launchCaller(String number, BuildContext context) async {
  final url = "tel:$number";
  if (await canLaunch(url)) {
    await launch(url);
  }
  Toast.createError(message: 'Could not launch number').show(context);
}