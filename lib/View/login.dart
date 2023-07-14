import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/View/register.dart';
import 'package:mini_project_menara_indonesia/Widgets/navbar.dart';
import 'package:mini_project_menara_indonesia/Widgets/transitions.dart';

import '../Widgets/input_data_field.dart';
import '../Widgets/input_password_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                  height: 200,
                ),
                InputDataField(
                  label: "Email",
                  hintext: "input email",
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                InputPasswordField(
                  label: "Password",
                  hintext: "input password",
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        // navReplaceTransition(context, NavBar());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white),
                      child: const Text("Login")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't Have Account?"),
                    TextButton(
                        onPressed: () {
                          navPushTransition(context, const RegisterPage());
                        },
                        child: const Text("Register"))
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
