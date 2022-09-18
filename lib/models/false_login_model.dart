import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FalseLoginModel {
  final bool success;
  final String message;
  FalseLoginModel({
    required this.success,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'message': message,
    };
  }

  factory FalseLoginModel.fromMap(Map<String, dynamic> map) {
    return FalseLoginModel(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FalseLoginModel.fromJson(String source) => FalseLoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
