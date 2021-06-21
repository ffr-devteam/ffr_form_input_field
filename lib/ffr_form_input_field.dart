library ffr_form_input_field;

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

typedef OnFieldSubmitted = void Function(String string);
typedef Validate = String ?Function(String? string);

class FFRFromInputField extends StatelessWidget {
  const FFRFromInputField({
    Key? key,
    required this.hintText,
    required this.backgroundColor,
    this.icon,
    required this.fieldKey,
    required this.isError,
    required this.textInputType,
    required this.validate,
    required this.textStyle,
    required this.errorColor,
    this.autofillHints,
    this.autofocus = false,
    this.onFieldSubmitted,
    this.focusNode,
  }) : super(key: key);

  final String hintText;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color errorColor;
  final Icon? icon;
  final TextInputType textInputType;
  final Validate validate;
  final Key fieldKey;
  final bool isError;
  final bool autofocus;
  final OnFieldSubmitted? onFieldSubmitted;
  final FocusNode? focusNode;
  final List<String>? autofillHints;

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
        autofillHints: autofillHints,
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
