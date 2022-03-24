import 'package:flutter/material.dart';

class NoItemTile extends StatelessWidget {
	final String value;

  const NoItemTile({Key? key,required this.value}) : super(key: key);
	@override
	Widget build(BuildContext context) {
		return Center(
		  child: SizedBox(
      height: 80.0,
      child: Center(
    		child: Text(
          value
      	),
      ),
    ),
		);
	}
}