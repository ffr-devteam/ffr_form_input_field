library ffr_form_input_field;

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

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
    this.autofocus = false,
    this.onFieldSubmitted,
    this.focusNode,
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
  final bool autofocus;
  final Function onFieldSubmitted;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kIsWeb ? 400 : 350,
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
        keyboardType: textInputType,
        autofocus: autofocus,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
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
