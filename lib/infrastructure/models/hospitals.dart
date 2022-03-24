import 'dart:convert';

class Hospitals {
	final String hosptId;
	final String name;
	final String address;
	final String phone;

  Hospitals({
    required this.hosptId,
    required this.name,
    required this.address,
    required this.phone,
  });

  Hospitals copyWith({
    String? hosptId,
    String? name,
    String? address,
    String? phone,
  }) {
    return Hospitals(
      hosptId: hosptId ?? this.hosptId,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'hosptId': hosptId,
      'name': name,
      'address': address,
      'phone': phone,
    };
  }

  factory Hospitals.fromMap(Map<String, dynamic> map) {
    return Hospitals(
      hosptId: map['hosptId'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Hospitals.fromJson(String source) => Hospitals.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Hospitals(hosptId: $hosptId, name: $name, address: $address, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Hospitals &&
      other.hosptId == hosptId &&
      other.name == name &&
      other.address == address &&
      other.phone == phone;
  }

  @override
  int get hashCode {
    return hosptId.hashCode ^
      name.hashCode ^
      address.hashCode ^
      phone.hashCode;
  }
}