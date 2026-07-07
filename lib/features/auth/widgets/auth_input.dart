import "package:flutter/material.dart";

class AuthInput extends StatelessWidget {
  const AuthInput({
    super.key,
    required this.label,
    required this.icon,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.autofillHints,
  });

  final String label;
  final IconData icon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      autofillHints: autofillHints,
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
    );
  }
}
