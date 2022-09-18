// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:checkstudent/utility/my_constant.dart';
import 'package:checkstudent/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class WidgetTextButton extends StatelessWidget {
  final String label;
  final Function() pressFunc;
  const WidgetTextButton({
    Key? key,
    required this.label,
    required this.pressFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: pressFunc,
        child: WidgetText(
          text: label,
          textStyle: MyConstant().h3ActiveStyle(),
        ));
  }
}
