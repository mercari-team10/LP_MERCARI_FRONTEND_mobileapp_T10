import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthWrapper extends StatelessWidget {
	const AuthWrapper({ Key? key }) : super(key: key);
	static final innerRouterKey = GlobalKey<AutoRouterState>();
	@override
	Widget build(BuildContext context) {
		return AutoRouter(key: innerRouterKey);
		// Scaffold(
		// 	body: Stack(
    //     fit: StackFit.expand,
		// 		children: [
		// 			Image.asset("assets/auth_bg.svg",
    //         height: MediaQuery.of(context).size.height,
		// 			),
		// 			Align(
		// 				alignment: Alignment.bottomCenter,
		// 				child: Padding(
		// 				  padding: const EdgeInsets.only(bottom: 16.0),
		// 				  child: Column(
		// 				  	children: [
		// 				  		// Elevated
		// 				  	],
		// 				  ),
		// 				),
		// 			)
		// 		] 
		// 	)
		// );
	}
}