import 'package:flutter/material.dart';
import 'package:hms_patient_frontend/ui/theme/colors.dart';

class DrawerTile extends StatelessWidget {
  final Widget? routeWidget;
  final Function? onTap;
  final Function? navigation;
  final String title;
  final IconData icon;
  // ignore: use_key_in_widget_constructors
  const DrawerTile({
    this.routeWidget,
    this.onTap,
    this.navigation,
    required this.title,
    required this.icon,
  }) : assert(routeWidget != null || onTap != null || navigation != null);
  @override
  Widget build(BuildContext context) {
    return InkWell(
				splashColor: CustomColors(context).accentColor,
        onTap: (){
          if(navigation != null){
            Navigator.of(context).pop();
            navigation!();
						return;
          }
          else {onTap!();}
        },
				focusColor: Colors.white,
        child: Container(
          height: 55.0,
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: <Widget>[
              Icon(icon),
              Container(
                margin: const EdgeInsets.only(left: 32.0, top: 15.0, bottom: 15.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 20.0, fontFamily: 'Nunito'),
                ),
              ),
            ],
          ),
        ));
  }
}
