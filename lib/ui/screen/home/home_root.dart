import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hms_patient_frontend/infrastructure/models/patient.dart';
import 'package:hms_patient_frontend/providers/auth/auth_cubit.dart';
import 'package:hms_patient_frontend/routes/routes.dart';
import 'package:provider/provider.dart';

import '../../../injection.dart';
import '../../../providers/api/api_cubit.dart';


class HomeRoot extends HookWidget {
	final Patient _patient;
	const HomeRoot(this._patient, { Key? key }) : super(key: key);
	
	static final innerRouterKey = GlobalKey<AutoRouterState>();
	@override
	Widget build(BuildContext context) {
		return MultiBlocProvider(
      providers: [
				BlocProvider(create: (context) => getIt<ApiCubit>()..loadApp()),
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
         	if(!state.isAuthenticated){
						 context.router.replace(const AuthWrapperRoute());
					 }
				},
        child: Provider(
					create: (_) => _patient,
					lazy: false,
					child: AutoRouter(key: innerRouterKey,)),
      ),
    );
	}
}