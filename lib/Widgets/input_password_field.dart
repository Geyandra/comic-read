import 'package:flutter/material.dart';

class InputPasswordField extends StatefulWidget {
  final String label;
  final String hintext;
  String? Function(String?)? validation;
  InputPasswordField({
    this.validation,
    required this.label,
    Key? key,
    required this.hintext,
  }) : super(key: key);

  @override
  State<InputPasswordField> createState() => _InputPasswordFieldState();
}

class _InputPasswordFieldState extends State<InputPasswordField> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: widget.validation,
        obscureText: _obsecureText,
        // validator: ,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obsecureText = !_obsecureText;
                  });
                },
                icon: Icon(
                    _obsecureText ? Icons.visibility : Icons.visibility_off)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: widget.hintext,
            suffixIconColor: Colors.blue,
            filled: true,
            fillColor: Colors.grey.shade100,
            label: Text(widget.label),
            labelStyle: TextStyle(color: Colors.blue.shade600),
            border: OutlineInputBorder(),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }
}
