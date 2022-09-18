// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:checkstudent/utility/my_constant.dart';
import 'package:checkstudent/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  final String label;
  final Function() pressFunc;
  const WidgetButton({
    Key? key,
    required this.label,
    required this.pressFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyConstant.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: pressFunc,
        child: WidgetText(
          text: label,
          textStyle: MyConstant().h3ButtonStyle(),
        ));
  }
}
