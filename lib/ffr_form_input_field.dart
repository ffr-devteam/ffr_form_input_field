library ffr_form_input_field;

import 'package:flutter/material.dart';

class FFRFromInputField extends StatelessWidget {
  const FFRFromInputField({
    Key key,
    @required this.hintText,
    @required this.backgroundColor,
    @required this.icon,
    @required this.fieldKey,
    @required this.isError,
    @required this.textInputType,
    @required this.validate,
    @required this.textStyle,
    @required this.errorColor,
  }) : super(key: key);

  final String hintText;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color errorColor;
  final Icon icon;
  final TextInputType textInputType;
  final Function validate;
  final Key fieldKey;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: isError ? errorColor : backgroundColor,
        ),
        borderRadius: BorderRadius.circular(35),
        color: backgroundColor,
      ),
      child: TextFormField(
        validator: validate,
        key: fieldKey,
        style: textStyle,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: textStyle,
          border: InputBorder.none,
          icon: icon,
        ),
      ),
    );
  }
}
