import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Mytextform extends StatelessWidget {
  Mytextform({super.key, required this.controller, required this.hint});
  final TextEditingController controller;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLength: 20,
        validator: (value) {
          if (value == "") {
            return ("can't be null");
          }
        },
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
      ),
    );
  }
}
