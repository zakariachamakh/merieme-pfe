import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:office_furniture_store/src/view/widget/verifaction.dart';

import '../screen/intro_screen.dart';

class FormSignup extends StatefulWidget {
  const FormSignup({super.key});

  @override
  State<FormSignup> createState() => _FormSignupState();
}

class _FormSignupState extends State<FormSignup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passenable = true;

  late bool? cheked;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signup() async {
    Map<String, String> headers = {'Accept': 'application/json'};
    final response = await http.post(
      Uri.parse(
          'https://emsi-64tat.ondigitalocean.app/api/auth/local/register'),
      headers: headers,
      body: {
        'username': usernameController.text,
        'email': emailController.text,
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
      // signup failed
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
            controller: usernameController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Name is wrong, please check again';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Name',
            ),
          ),
          TextFormField(
            controller: emailController,
            validator: (String? value) {
              bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value!);
              if ((value == null || value.isEmpty)) {
                return 'Email is wrong, please check again';
              } else if (!emailValid)
                return 'Email is not correct, please check again';
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
          ),
          SizedBox(
            height: 80,
            child: TextFormField(
              controller: passwordController,
              obscureText: passenable,
              decoration: InputDecoration(
                hintText: "Password",
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      if (passenable) {
                        passenable = false;
                      } else
                        passenable = true;
                    });
                  },
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
          ),
          CheckboxListTile(
            activeColor: Colors.black54,
            checkColor: Colors.white,
            title: const Text(
              'I agree with our Terms and Conditions',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            value: timeDilation != 1.0,
            onChanged: (bool? value) {
              setState(() {
                timeDilation = value! ? 2.0 : 1.0;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: SizedBox(
              width: 400,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(5),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.brown.shade400,
                  ),
                ),
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    signup();
                    Get.to(const IntroScreen());
                  }
                },
                child: Text(
                  'Sign Up',
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
