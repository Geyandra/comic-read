import 'package:flutter/material.dart';

class FieldData extends StatelessWidget {
  final String label;
  final String hintext;
  const FieldData({
    required this.label,
    Key? key,
    required this.hintext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintext,
            suffixIconColor: Colors.blue,
            filled: true,
            fillColor: Colors.grey.shade100,
            label: Text(label),
            labelStyle: TextStyle(color: Colors.blue.shade600),
            border: OutlineInputBorder(),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }
}
