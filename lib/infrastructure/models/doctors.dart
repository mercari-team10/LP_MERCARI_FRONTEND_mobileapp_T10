import 'dart:convert';

class Doctors {
  final String name;
  final String docId;
  final String specialisation;

  Doctors({
    required this.name,
    required this.docId,
    required this.specialisation,
  });

  Doctors copyWith({
    String? name,
    String? docId,
    String? specialisation,
  }) {
    return Doctors(
      name: name ?? this.name,
      docId: docId ?? this.docId,
      specialisation: specialisation ?? this.specialisation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'docId': docId,
			// TODO: Update specialisation
      'specialisation': specialisation,
    };
  }

  factory Doctors.fromMap(Map<String, dynamic> map) {
    return Doctors(
      name: map['name'] ?? '',
      docId: map['id'] ?? '',
			// TODO: Update specialisation
      specialisation: map['special'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctors.fromJson(String source) => Doctors.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Doctors &&
      other.name == name &&
      other.docId == docId &&
      other.specialisation == specialisation;
  }

  @override
  int get hashCode => name.hashCode ^ docId.hashCode ^ specialisation.hashCode;
}
