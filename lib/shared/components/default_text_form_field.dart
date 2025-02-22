import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    super.key,
    required this.hint,
    this.onChanged,
    required this.label,
    required this.prefixIcon,
    this.autoFocuse = false,
    required this.controller,
    this.textInputType = TextInputType.text,
  });
  final TextEditingController controller;
  final String hint;
  final Function(String)? onChanged;
  final String label;
  final IconData prefixIcon;
  final bool autoFocuse;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.labelMedium,
      autofocus: autoFocuse,
      controller: controller,
      keyboardType: textInputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: borderForTextFormField(
          context,
          Colors.grey,
        ),
        focusedBorder: borderForTextFormField(
          context,
          Colors.blue,
        ),
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        prefixIconColor: Colors.blue,
        labelText: label,
        floatingLabelStyle: TextStyle(
          color: Colors.blue,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey,
        ),
      ),
    );
  }
}

OutlineInputBorder borderForTextFormField(context, Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      width: 2.5,
      color: color,
    ),
  );
}
