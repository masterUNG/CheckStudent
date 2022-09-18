// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetForm extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final Function(String) changeFunc;
  final bool? obsecu;
  final double? top;
  final TextInputType? textInputType;
  const WidgetForm({
    Key? key,
    required this.hint,
    required this.iconData,
    required this.changeFunc,
    this.obsecu,
    this.top,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top ?? 16),
      child: TextFormField(keyboardType: textInputType ?? TextInputType.text,
        obscureText: obsecu ?? false,
        onChanged: changeFunc,
        decoration: InputDecoration(
          suffixIcon: Icon(iconData),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          hintText: hint,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
