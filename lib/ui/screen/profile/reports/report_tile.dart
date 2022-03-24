import 'package:flutter/material.dart';
import 'package:hms_patient_frontend/infrastructure/models/reports.dart';

class ReportTile extends StatelessWidget {
	const ReportTile({ Key? key, required this.reports }) : super(key: key);
	final Reports reports;
	@override
	Widget build(BuildContext context) {
		return Card(
			shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
			child: Column(
				children: [
					Text(
						reports.reportType,
						// report.typeOfBill,
						style: TextStyle(
							fontSize: 10
						),
					)
				],
			),
		);
	}
}