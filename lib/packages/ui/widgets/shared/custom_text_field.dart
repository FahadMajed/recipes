import 'package:flutter/material.dart';
import '../../ui.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final String? labelText;
  final int? maxLines;
  final int? maxLength;
  final bool isObscure;
  final bool? isEnabled;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final String? hintText;
  final Function(String?)? onChanged;
  final Function()? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Function()? onEditingComplete;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final bool autoFocus;
  final TextInputAction action;
  final double height;
  final TextAlign textAlign;

  const CustomTextField(
      {this.focusNode,
      Key? key,
      this.height = 55,
      this.textAlign = TextAlign.start,
      this.controller,
      this.hintStyle,
      this.isEnabled,
      this.onEditingComplete,
      this.labelText,
      this.isObscure = false,
      this.validator,
      this.onFieldSubmitted,
      this.suffixIcon,
      this.inputType,
      this.hintText,
      this.onChanged,
      this.maxLines = 1,
      this.autoFocus = false,
      this.action = TextInputAction.next,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign,
      autofocus: autoFocus,
      controller: controller,
      enabled: isEnabled == null ? true : false,
      autovalidateMode: AutovalidateMode.disabled,
      onEditingComplete: onEditingComplete,
      validator: validator,
      focusNode: focusNode,
      obscureText: isObscure,
      decoration: InputDecoration(
        alignLabelWithHint: true,

        labelText: labelText?.tr,
        labelStyle: descMed,
        suffixIcon: suffixIcon,
        // hintStyle: hintStyle == null ? descSmall : hintStyle,
        filled: true,
        fillColor: secondayColor,
        border: const OutlineInputBorder(
          borderRadius: radius,
          borderSide: BorderSide(color: Colors.black, width: 0.5),
        ),
        hintText: hintText?.tr,
        counterText: '',
      ),
      maxLines: maxLines ?? 1,
      maxLength: maxLength ?? 25,
      keyboardType: inputType ?? TextInputType.text,
      textInputAction: action,
      onChanged: onChanged,
    );
  }
}
