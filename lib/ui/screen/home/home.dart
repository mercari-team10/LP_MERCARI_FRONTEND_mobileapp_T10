import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hms_patient_frontend/ui/theme/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';

import '../../../routes/routes.dart';

class NavBarItem {
	final IconData icon;
	final int index;
	final String label;

  NavBarItem(this.icon, this.index, this.label);
}

List<NavBarItem> navigationBarItems = [
	NavBarItem(AntDesign.home, 0, 'Home'),
	NavBarItem(Icons.calendar_month_outlined, 1, 'Appointments'),
	NavBarItem(AntDesign.user, 2, 'Profile')
];

class HomePage extends HookWidget {
	const HomePage({ Key? key }) : super(key: key);
	// final GlobalKey<ScaffoldState> _key = GlobalKey(); 
	@override
	Widget build(BuildContext context) {
		// final _sIndex = useState(0);
		return AutoTabsRouter(
			routes: const [
				HomeTabRoute(),
				// HospitalsRoute(),
				AppointmentsRoute(),
				ProfileRoute()
			],
		  builder: (context, child, animation) {
				final tRouter = AutoTabsRouter.of(context);
		    return Scaffold(
		    	body: FadeTransition(opacity: animation,
						child: SafeArea(child: child),
					),
		    	bottomNavigationBar: Container(
						decoration: BoxDecoration(
							color: Colors.white,
							boxShadow: [
								BoxShadow(
									blurRadius: 20,
									color: Colors.black.withOpacity(.1),
								)
							],
						),
						child: SafeArea(
							child: Padding(
								padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
								child: GNav(
									rippleColor: Colors.grey[300]!,
									hoverColor: Colors.grey[100]!,
									gap: 8,
									tabBorderRadius: 16,
									activeColor: Colors.white,
									iconSize: 24,
									padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
									duration: const Duration(milliseconds: 400),
									tabBackgroundColor: Colors.blue[700]!,
									color: Colors.black,
									tabs: [
										for(var i in navigationBarItems)
											GButton(
												icon: i.icon,
												text: i.label
											),
									],
									selectedIndex: tRouter.activeIndex,
									onTabChange: (i)=> tRouter.setActiveIndex(i),
								),
							)
						)
					)
		    );
		  }
		);
	}
}

