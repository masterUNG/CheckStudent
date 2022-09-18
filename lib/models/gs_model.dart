// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GsModel {
  final String thesis_title_th;
  final String advisor_position;
  final String advisor_firstname;
  final String advisor_lastname;
  GsModel({
    required this.thesis_title_th,
    required this.advisor_position,
    required this.advisor_firstname,
    required this.advisor_lastname,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thesis_title_th': thesis_title_th,
      'advisor_position': advisor_position,
      'advisor_firstname': advisor_firstname,
      'advisor_lastname': advisor_lastname,
    };
  }

  factory GsModel.fromMap(Map<String, dynamic> map) {
    return GsModel(
      thesis_title_th: map['thesis_title_th'] ?? '' ,
      advisor_position: map['advisor_position'] ?? '',
      advisor_firstname: map['advisor_firstname'] ?? '',
      advisor_lastname: map['advisor_lastname'] ?? '',
    );
  }

  factory GsModel.fromJson(String source) => GsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
