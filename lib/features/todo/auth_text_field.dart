import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {

  const AuthTextField({
    super.key,
    required this.label,
    required this.controller,
    this.obscure = false,
  });
  final String label;
  final TextEditingController controller;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
