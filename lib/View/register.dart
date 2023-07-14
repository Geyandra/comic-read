import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/View/login.dart';
import 'package:mini_project_menara_indonesia/Widgets/input_data_field.dart';
import 'package:mini_project_menara_indonesia/Widgets/input_password_field.dart';
import 'package:mini_project_menara_indonesia/Widgets/transitions.dart';

import '../Widgets/navbar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final RegExp nameRegExp = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
    final RegExp emailRegExp =
        RegExp("^[a-zA-Z0-9_.+-]*(@([a-zA-Z0-9-]*(\\.[a-zA-Z0-9-]*)?)?)?");
    final RegExp passRegExp =
        RegExp("^[a-zA-Z0-9_.+-]*(@([a-zA-Z0-9-]*(\\.[a-zA-Z0-9-]*)?)?)?");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Register"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned(
            child: ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  color: Colors.blue.shade50,
                  height: 200,
                )),
          ),
          Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 40,
                ),
                InputDataField(
                    label: "Name",
                    hintext: "input your name",
                    validation: (value) => value == null || value.isEmpty
                        ? "Enter your name"
                        : (nameRegExp.hasMatch(value))
                            ? null
                            : "Enter valid name"),
                InputDataField(
                  label: "Username",
                  hintext: "input username",
                  // validation: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter some text';
                  //   }
                  //   return null;
                  // },
                ),
                InputDataField(
                  label: "Email",
                  hintext: "input your email",
                  // validation: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter some text';
                  //   }
                  //   return null;
                  // },
                ),
                InputPasswordField(
                  label: "Password",
                  hintext: "input your password here",
                  // validation: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter some text';
                  //   }
                  //   return null;
                  // },
                ),
                InputPasswordField(
                  label: "Confirm Password",
                  hintext: "confirm password",
                  // validation: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter some text';
                  //   }
                  //   return null;
                  // },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white),
                      child: const Text("Register")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have Account?"),
                    TextButton(
                        onPressed: () {
                          navPushTransition(context, const LoginPage());
                        },
                        child: const Text("Login"))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.39, h * 0.98, w * 0.5, h * 0.77);
    path.quadraticBezierTo(w * 0.72, h * 0.61, w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
