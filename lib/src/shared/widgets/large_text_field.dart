import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LargeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String keyText;
  final String hintText;
  final TextInputType keyboardType;
  final bool hideText;

  LargeTextField({
    this.controller,
    this.keyText,
    this.hintText,
    this.keyboardType,
    this.hideText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: Key(keyText),
      controller: controller,
      keyboardType: keyboardType,
      autofocus: false,
      obscureText: hideText,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }
}
