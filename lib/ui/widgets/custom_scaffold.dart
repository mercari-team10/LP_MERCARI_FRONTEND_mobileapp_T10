import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomScaffold extends StatelessWidget {
	final String? title;
	final Drawer? drawer;
	final Widget? bottomNavigationBar;
	final List<Widget>? appBarActions;
	final AppBar? appBar;
	final Widget? body;

  const CustomScaffold({
		Key ?key, 
		this.title, 
		this.drawer, 
		this.appBarActions, 
		this.bottomNavigationBar,
		this.body, 
		this.appBar}) : super(key: key);
		// :assert();
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: appBar ??AppBar(
				title: title!=null
					? Text(title!,
					style: TextStyle(color: CustomColors(context).textColor,
						fontFamily: CustomColors(context).fontFamily
					),
				): null,
				actions: appBarActions,
			),
			drawer: drawer,
			body: body,
			bottomNavigationBar: bottomNavigationBar,
			drawerEdgeDragWidth: MediaQuery.of(context).size.width * 0.2,
		);
	}
}