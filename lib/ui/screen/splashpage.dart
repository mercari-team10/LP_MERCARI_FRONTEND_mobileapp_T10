import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_patient_frontend/infrastructure/models/patient.dart';
import 'package:hms_patient_frontend/providers/auth/auth_cubit.dart';
import 'package:hms_patient_frontend/routes/routes.dart';

class SplashPage extends StatelessWidget {
	const SplashPage({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		// return HomeRoot();
		return BlocListener<AuthCubit,AuthState>(
			listener: (context, state) {
				log('$state', name: 'Splash Page');
			  if(!state.inProgress){
					if(state.isAuthenticated){
						context.router.replace(HomeRootRoute(patient: Patient.empty));
					}else {
						context.router.replace(const AuthWrapperRoute());
					}
				}
			},
			child: const Scaffold(
				body: Center(
					child: CircularProgressIndicator()
				)
				// Stack(
				// 	fit: StackFit.expand,
				// 	// mainAxisAlignment: MainAxisAlignment.center,
				//   children: [Align(
				// 			// top: MediaQuery.of(context).size.height * 0.5 + 40,
				// 			child: Container(
				// 				// margin: EdgeInsets.only(
				// 				// 	top: MediaQuery.of(context).size.height *0.6
				// 				// ),
				// 				child: const Center(child: CircularProgressIndicator()))),
				//   ],
				// )
			),
		);
	}
}