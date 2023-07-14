import 'package:flutter/material.dart';

class InputDataField extends StatelessWidget {
  final String label;
  final String hintext;
  final int? maxlines;
  String? Function(String?)? validation;
  InputDataField({
    this.validation,
    required this.label,
    Key? key,
    required this.hintext, this.maxlines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: validation,
        maxLines: maxlines,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintext,
            suffixIconColor: Colors.blue,
            filled: true,
            fillColor: Colors.grey.shade100,
            label: Text(label),
            labelStyle: TextStyle(color: Colors.blue.shade600),
            border: const OutlineInputBorder(),
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }
}