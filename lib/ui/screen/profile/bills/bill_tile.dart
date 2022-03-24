import 'package:flutter/material.dart';
import 'package:hms_patient_frontend/infrastructure/models/bills.dart';

class BillTile extends StatelessWidget {
	const BillTile({ Key? key, required this.bill }) : super(key: key);
	final Bills bill;
	@override
	Widget build(BuildContext context) {
		return Card(
			shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
			child: Column(
				children: [
					Text(
						bill.typeOfBill,
						style: TextStyle(
							fontSize: 10
						),
					)
				],
			),
		);
	}
}