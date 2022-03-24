import 'dart:convert';

import 'package:flutter/foundation.dart';

// import '../schema.dart';

class Patient {
	final String nhid;
	final String username;
	final String name;
	final String phNo;
	final String? aadhar;
	final int dob; // timestamp
	final String? gender;
	final String? cDisease;
	final List bills;
	final List reports;

  Patient({
    required this.nhid,
    required this.username,
    required this.name,
    required this.phNo,
    required this.aadhar,
    required this.dob,
    this.gender,
    this.cDisease,
    this.bills = const [],
    this.reports = const []
  });
	// static final _schema = Schema();

  Patient copyWith({
    String? nhid,
    String? username,
    String? name,
    String? phNo,
    String? aadhar,
    int? dob,
    String? gender,
    String? cDisease,
    List? bills,
    List? reports,
  }) {
    return Patient(
      nhid: nhid ?? this.nhid,
      username: username ?? this.username,
      name: name ?? this.name,
      phNo: phNo ?? this.phNo,
      aadhar: aadhar ?? this.aadhar,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      cDisease: cDisease ?? this.cDisease,
      bills: bills ?? this.bills,
      reports: reports ?? this.reports,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'nhid': nhid,
      'username': username,
      'name': name,
      'phone': phNo,
      'aadhar': aadhar,
      'dob': dob,
      'gender': gender,
      // 'cDisease': cDisease,
      // 'bills': bills,
      // 'reports': reports,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      nhid: map['nhid'] ?? '',
      username: map['username'] ?? '',
      name: map['name'] ?? '',
      phNo: map['phone'] ?? '',
      aadhar: map['aadhar'],
      dob: map['dob'] ?? 0,
      gender: map['gender'],
      cDisease: map['cDisease'],
      bills: List.from(map['bills']??[]),
      reports: List.from(map['reports']??[]),
    );
  }

	static Patient get empty => Patient(
		nhid: '', username: '', 
		name: '', phNo: '', 
		aadhar: '', dob: 0);

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) => Patient.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Patient &&
      other.nhid == nhid &&
      other.username == username &&
      other.name == name &&
      other.phNo == phNo &&
      other.aadhar == aadhar &&
      other.dob == dob &&
      other.gender == gender &&
      other.cDisease == cDisease &&
      listEquals(other.bills, bills) &&
      listEquals(other.reports, reports);
  }

  @override
  int get hashCode {
    return nhid.hashCode ^
      username.hashCode ^
      name.hashCode ^
      phNo.hashCode ^
      aadhar.hashCode ^
      dob.hashCode ^
      gender.hashCode ^
      cDisease.hashCode ^
      bills.hashCode ^
      reports.hashCode;
  }
}
