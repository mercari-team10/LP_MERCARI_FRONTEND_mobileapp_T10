import 'dart:convert';

import '../schema.dart';

class Params {
  final String nhid;
  final String? hosptId;
  final String? docId;
  final String? labId;
	final String? testId;
	/// values seprated by comma
  final String? symptoms;
  final int? startTime;
  final int? endTime;
  final int? duration;
	
  Params({
    required this.nhid,
    this.hosptId,
    this.docId,
    this.labId,
    this.testId,
    this.symptoms,
    this.startTime,
    this.endTime,
    this.duration
  });

	final _schema = Schema();

  Params copyWith({
    String? nhid,
    String? hosptId,
    String? docId,
    String? labId,
    String? testId,
    String? symptoms,
    int? startTime,
    int? endTime,
    int? duration,
  }) {
    return Params(
      nhid: nhid ?? this.nhid,
      hosptId: hosptId ?? this.hosptId,
      docId: docId ?? this.docId,
      labId: labId ?? this.labId,
      testId: testId ?? this.testId,
      symptoms: symptoms ?? this.symptoms,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      _schema.nhid : nhid,
      _schema.hosptId: hosptId,
      _schema.docId: docId,
      _schema.labId: labId,
      _schema.testId: testId,
      _schema.symptoms: symptoms,
      _schema.startTime: startTime,
      _schema.endTime: endTime,
      _schema.duration: duration,
    };
  }

  factory Params.fromMap(Map<String, dynamic> map) {
    return Params(
      nhid: map[Schema().nhid] ?? '',
      hosptId: map[Schema().hosptId],
      docId: map[Schema().docId],
      labId: map[Schema().labId],
      testId: map[Schema().testId],
      symptoms: map[Schema().symptoms],
      startTime: map[Schema().startTime]?.toInt(),
      endTime: map[Schema().endTime]?.toInt(),
      duration: map[Schema().duration]?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Params.fromJson(String source) => Params.fromMap(json.decode(source));


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Params &&
      other.nhid == nhid &&
      other.hosptId == hosptId &&
      other.docId == docId &&
      other.labId == labId &&
      other.testId == testId &&
      other.symptoms == symptoms &&
      other.startTime == startTime &&
      other.endTime == endTime &&
      other.duration == duration;
  }

  @override
  int get hashCode {
    return nhid.hashCode ^
      hosptId.hashCode ^
      docId.hashCode ^
      labId.hashCode ^
      testId.hashCode ^
      symptoms.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      duration.hashCode;
  }
}
