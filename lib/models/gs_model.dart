// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GsModel {
  final String thesis_title_th;
  final String advisor_position;
  final String advisor_firstname;
  final String advisor_lastname;
  final String student_assign_date;
  final String permit_date;
  final String ethics_date;
  final String exam_date;
  final String thesiscomplete_date;
  final String publication_date;
  GsModel({
    required this.thesis_title_th,
    required this.advisor_position,
    required this.advisor_firstname,
    required this.advisor_lastname,
    required this.student_assign_date,
    required this.permit_date,
    required this.ethics_date,
    required this.exam_date,
    required this.thesiscomplete_date,
    required this.publication_date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thesis_title_th': thesis_title_th,
      'advisor_position': advisor_position,
      'advisor_firstname': advisor_firstname,
      'advisor_lastname': advisor_lastname,
      'student_assign_date': student_assign_date,
      'permit_date': permit_date,
      'ethics_date': ethics_date,
      'exam_date': exam_date,
      'thesiscomplete_date': thesiscomplete_date,
      'publication_date': publication_date,
    };
  }

  factory GsModel.fromMap(Map<String, dynamic> map) {
    return GsModel(
      thesis_title_th: (map['thesis_title_th'] ?? '') as String,
      advisor_position: (map['advisor_position'] ?? '') as String,
      advisor_firstname: (map['advisor_firstname'] ?? '') as String,
      advisor_lastname: (map['advisor_lastname'] ?? '') as String,
      student_assign_date: (map['student_assign_date'] ?? '') as String,
      permit_date: (map['permit_date'] ?? '') as String,
      ethics_date: (map['ethics_date'] ?? '') as String,
      exam_date: (map['exam_date'] ?? '') as String,
      thesiscomplete_date: (map['thesiscomplete_date'] ?? '') as String,
      publication_date: (map['publication_date'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GsModel.fromJson(String source) => GsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
