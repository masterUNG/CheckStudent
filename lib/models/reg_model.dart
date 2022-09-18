// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegModel {
  final String STUDENTNAME;
  final String STUDENTSURNAME;
  final String PROGRAMNAME;
  final String PROGRAMNAMEBRANCH;
  final String PROGRAMNAMECERTIFY;
  final String FACULTYNAME;
  final String LEVELNAME;

  RegModel({
    required this.STUDENTNAME,
    required this.STUDENTSURNAME,
    required this.PROGRAMNAME,
    required this.PROGRAMNAMEBRANCH,
    required this.PROGRAMNAMECERTIFY,
    required this.FACULTYNAME,
    required this.LEVELNAME,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'STUDENTNAME': STUDENTNAME,
      'STUDENTSURNAME': STUDENTSURNAME,
      'PROGRAMNAME': PROGRAMNAME,
      'PROGRAMNAMEBRANCH': PROGRAMNAMEBRANCH,
      'PROGRAMNAMECERTIFY': PROGRAMNAMECERTIFY,
      'FACULTYNAME': FACULTYNAME,
      'LEVELNAME': LEVELNAME,
    };
  }

  factory RegModel.fromMap(Map<String, dynamic> map) {
    return RegModel(
      STUDENTNAME: map['STUDENTNAME'] as String,
      STUDENTSURNAME: map['STUDENTSURNAME'] as String,
      PROGRAMNAME: map['PROGRAMNAME'] as String,
      PROGRAMNAMEBRANCH: map['PROGRAMNAMEBRANCH'] as String,
      PROGRAMNAMECERTIFY: map['PROGRAMNAMECERTIFY'] as String,
      FACULTYNAME: map['FACULTYNAME'] as String,
      LEVELNAME: map['LEVELNAME'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegModel.fromJson(String source) =>
      RegModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
