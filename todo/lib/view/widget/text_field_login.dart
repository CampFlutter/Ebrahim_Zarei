import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  String hint;
  IconData icon;
  bool password;
  TextEditingController controller;
  Function(String) onChanged;
  TextFieldLogin(
      {super.key,
      required this.hint,
      required this.icon,
      required this.controller,
      required this.onChanged,
      this.password = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
      ),
      onChanged: onChanged,
      controller: controller,
      obscureText: password ? true : false,
    );
  }
}
