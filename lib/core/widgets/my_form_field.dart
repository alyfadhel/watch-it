import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final FormFieldValidator<String>? validator;
  final double radius;
  final String label;
  final bool isUpperCase;
  final IconData prefix;
  final Function()? onPressed;
  final IconData? suffix;
  final bool? enable;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  final bool showIcon;

  const MyFormField({
    super.key,
    required this.controller,
    required this.type,
    this.radius = 10.0,
    required this.label,
    this.isUpperCase = true,
    required this.prefix,
    this.suffix,
    this.enable,
    required this.validator,
    this.onPressed,
    this.isPassword = false,
    this.onChanged,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      controller: controller,
      keyboardType: type,
      validator: validator,
      obscureText: isPassword,
      enabled: enable,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(.4),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide:
                BorderSide(color: Colors.grey.withOpacity(.4), width: 3.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.red, width: 3.0),
        ),
        label: Text(
          isUpperCase ? label.toUpperCase() : label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        prefixIcon: Icon(
          prefix,
          color: Colors.white,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  suffix,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
