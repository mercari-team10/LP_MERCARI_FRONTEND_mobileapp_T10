import 'dart:convert';

import '../schema.dart';

class Bills {
  final int billId;
  final String patientId;
  final String hosptId;
  final String timeStamp;
  final int cost;
  final String typeOfBill;
  final String url;

  Bills({
		required this.billId,
    required this.patientId,
    required this.hosptId,
    required this.timeStamp,
    required this.cost,
    required this.typeOfBill,
    required this.url});
	final schema = Schema();
  Bills copyWith({
    int? billId,
    String? patientId,
    String? hosptId,
    String? timeStamp,
    int? cost,
    String? typeOfBill,
    String? url,
  }) {
    return Bills(
      billId: billId ?? this.billId,
      patientId: patientId ?? this.patientId,
      hosptId: hosptId ?? this.hosptId,
      timeStamp: timeStamp ?? this.timeStamp,
      cost: cost ?? this.cost,
      typeOfBill: typeOfBill ?? this.typeOfBill,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      schema.billId: billId,
      schema.patientId: patientId,
      schema.hosptId: hosptId,
      schema.timeStamp: timeStamp,
      schema.cost: cost,
      schema.typeOfBill: typeOfBill,
      url: url,
    };
  }

  factory Bills.fromMap(Map<String, dynamic> map) {
    return Bills(
      billId: map[Schema().billId]?.toInt() ?? 0,
      patientId: map[Schema().patientId] ?? '',
      hosptId: map[Schema().hosptId] ?? '',
      timeStamp: map[Schema().timeStamp] ?? '',
      cost: map[Schema().cost]?.toInt() ?? 0,
      typeOfBill: map[Schema().typeOfBill] ?? '',
      url: map[Schema().url] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Bills.fromJson(String source) => Bills.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Bills &&
      other.billId == billId &&
      other.patientId == patientId &&
      other.hosptId == hosptId &&
      other.timeStamp == timeStamp &&
      other.cost == cost &&
      other.typeOfBill == typeOfBill &&
      other.url == url;
  }

  @override
  int get hashCode {
    return billId.hashCode ^
      patientId.hashCode ^
      hosptId.hashCode ^
      timeStamp.hashCode ^
      cost.hashCode ^
      typeOfBill.hashCode ^
      url.hashCode;
  }
}
