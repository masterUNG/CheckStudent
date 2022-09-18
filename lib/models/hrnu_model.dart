// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HrnuModel {
  final String POSITION;
  final String FNAME;
  final String LNAME;
  HrnuModel({
    required this.POSITION,
    required this.FNAME,
    required this.LNAME,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'POSITION': POSITION,
      'FNAME': FNAME,
      'LNAME': LNAME,
    };
  }

  factory HrnuModel.fromMap(Map<String, dynamic> map) {
    return HrnuModel(
      POSITION: map['POSITION'] ?? '',
      FNAME: map['FNAME'] ?? '',
      LNAME: map['LNAME'] ?? '',
    );
  }

  factory HrnuModel.fromJson(String source) =>
      HrnuModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
