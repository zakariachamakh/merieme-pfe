import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../screen/intro_screen.dart';

class FormLogin extends StatelessWidget {
  final TextEditingController identifierController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passenable = true;

  Future<void> login() async {
    Map<String, String> headers = {'Accept': 'application/json'};
    final response = await http.post(
      Uri.parse('https://emsi-64tat.ondigitalocean.app/api/auth/local'),
      headers: headers,
      body: {
        'identifier': identifierController.text,
        'password': passwordController.text,
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final box = GetStorage();
      box.write('jwt', jsonResponse['jwt']);
      box.write('username', jsonResponse['user']['username']);
      box.write('email', jsonResponse['user']['email']);
      box.write('id', jsonResponse['user']['id']);
      Get.to(const IntroScreen());
    } else {
      // login failed
    }

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: identifierController,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: passenable,
            decoration: InputDecoration(
              hintText: "Password",
              suffix: IconButton(
                onPressed: () {},
                icon: Icon((passenable == false)
                    ? Icons.password
                    : Icons.remove_red_eye),
              ),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Email or password is wrong, please check again';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 30),
            child: SizedBox(
              width: 400,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(8),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.brown,
                  ),
                ),
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    login();
                  }
                },
                child: Text(
                  'Sign In',
                  style: GoogleFonts.inter(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
