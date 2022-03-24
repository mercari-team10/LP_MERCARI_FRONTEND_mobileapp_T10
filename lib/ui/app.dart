import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hms_patient_frontend/ui/theme/colors.dart';

import '../injection.dart';
import '../providers/auth/auth_cubit.dart';
import '../routes/routes.dart';


const Map<ThemeMode, String> theme = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const Map<String, ThemeMode> themefromString = {
  'system': ThemeMode.system,
  'dark': ThemeMode.dark,
  'light': ThemeMode.light
};


class App extends StatelessWidget {
	const App({ Key? key }) : super(key: key);
	@override
	Widget build(BuildContext context) {
		final _autorouter = getIt<AppRouter>();
		return MultiBlocProvider(
			providers: [
				BlocProvider(
					create: (context) => getIt<AuthCubit>()..authCheckRequested()
				)
			],
			child: ValueListenableBuilder<Box<String>>(
        valueListenable: Hive.box<String>('theme').listenable(keys: [0]),
				builder: (context, value, _) => GestureDetector(
					onTap: (){
						final FocusScopeNode currentFocus = FocusScope.of(context);
							if (!currentFocus.hasPrimaryFocus) {
								currentFocus.unfocus();
							}
					},
					child: MaterialApp.router(
						title: 'HMS',
            debugShowCheckedModeBanner: false,
                // onGenerateRoute: Router(),
            darkTheme: CustomTheme(context).darkTheme,
            theme: CustomTheme(context).lightTheme,
            themeMode: themefromString[
                    value.get(0, defaultValue: theme[ThemeMode.system])],
						routerDelegate: AutoRouterDelegate(_autorouter),
						routeInformationParser: _autorouter.defaultRouteParser(),
					),
				),
			),
		);
	}
}