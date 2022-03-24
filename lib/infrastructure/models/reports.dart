import 'dart:convert';

import 'package:flutter/foundation.dart';

class Reports {
	final String id;
	final String reportType;
	final String issuerType;
	final String issuerId;
	final List<String> attachments;
	final String comments;
	final int timestamp;

  Reports({ 
		required this.id, 
		required this.reportType, 
		required this.issuerType, 
		required this.issuerId, 
		required this.attachments, 
		required this.comments, 
		required this.timestamp});

  Reports copyWith({
    String? id,
    String? reportType,
    String? issuerType,
    String? issuerId,
    List<String>? attachments,
    String? comments,
    int? timestamp,
  }) {
    return Reports(
      id: id ?? this.id,
      reportType: reportType ?? this.reportType,
      issuerType: issuerType ?? this.issuerType,
      issuerId: issuerId ?? this.issuerId,
      attachments: attachments ?? this.attachments,
      comments: comments ?? this.comments,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'reportType': reportType,
      'issuerType': issuerType,
      'issuerId': issuerId,
      'attachments': attachments,
      'comments': comments,
      'timestamp': timestamp,
    };
  }

  factory Reports.fromMap(Map<String, dynamic> map) {
    return Reports(
      id: map['_id'] ?? '',
      reportType: map['recordType'] ?? '',
      issuerType: map['issuerType'] ?? '',
      issuerId: map['issuerId'] ?? '',
      attachments: List<String>.from(map['attachments']),
      comments: map['comments'] ?? '',
      timestamp: map['timestamp']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reports.fromJson(String source) => Reports.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Reports(id: $id, reportType: $reportType, issuerType: $issuerType, issuerId: $issuerId, attachments: $attachments, comments: $comments, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Reports &&
      other.id == id &&
      other.reportType == reportType &&
      other.issuerType == issuerType &&
      other.issuerId == issuerId &&
      listEquals(other.attachments, attachments) &&
      other.comments == comments &&
      other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      reportType.hashCode ^
      issuerType.hashCode ^
      issuerId.hashCode ^
      attachments.hashCode ^
      comments.hashCode ^
      timestamp.hashCode;
  }
}
