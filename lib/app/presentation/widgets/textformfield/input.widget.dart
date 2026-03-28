import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hipoteca/src/styles/colors/colors.dart';

class TextFormInput extends StatelessWidget {
  final String? initialValue;
  final String? text;
  final String? hintText;
  final String? labelText;
  final bool readOnly;
  final bool? enabled;
  final TextEditingController? controller;
  final Color? fillColor;
  final Function(String value)? onChanged;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final void Function()? onEditingComplete;
  final int? maxLength;

  const TextFormInput({
    Key? key,
    this.initialValue,
    this.text,
    this.hintText,
    this.labelText,
    this.enabled,
    this.readOnly = false,
    this.controller,
    this.fillColor,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.inputFormatters,
    this.suffix,
    this.onEditingComplete,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        style: TextStyle(color: kTextColor),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          suffix: suffix,
          contentPadding: EdgeInsets.all(12),
          labelStyle: TextStyle(color: kTextColor),
          suffixStyle: TextStyle(color: kTextColor),
          floatingLabelStyle: TextStyle(color: kPrimaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: kTextColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: kPrimaryColor.withValues(alpha: 0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: kPrimaryColor.withValues(alpha: 0.3)),
          ),
        ),
        textCapitalization: TextCapitalization.sentences,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        readOnly: readOnly,
        enabled: enabled,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        maxLength: maxLength,
      ),
    );
  }
}
