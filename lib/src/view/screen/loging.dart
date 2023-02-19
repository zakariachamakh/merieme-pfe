import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:office_furniture_store/src/view/screen/singup.dart';

import '../widget/login.dart';
import 'intro_screen.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 115,
            left: 150,
            child: Text(
              "Login",
              style:
                  GoogleFonts.inter(fontSize: 29, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 170,
            left: 20,
            child: Text(
              textAlign: TextAlign.center,
              "Welcome back,\nSign in to continue etiam tacimates sed ad",
              style: GoogleFonts.inter(
                  color: Colors.black45,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Positioned(
            top: 235,
            left: 18,
            width: 360,
            child: FormLogin(),
          ),
          Positioned(
            top: 475,
            left: 10,
            child: Row(children: [
              Text(
                "Don’t have an account?",
                style: GoogleFonts.inter(color: Colors.black38, fontSize: 18),
              ),
              ElevatedButton(
                child: Text(
                  "Create account",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.brown.shade400,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Signup(),
                    ),
                  );
                },
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.transparent,
                  ),
                ),
              ),
            ]),
          ),
          Positioned(
            top: 528,
            left: 90,
            child: Text(
              "Login with social media",
              style: GoogleFonts.inter(color: Colors.black38, fontSize: 18),
            ),
          ),
          Positioned(
            top: 560,
            left: 230,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "t",
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.brown,
                    fontWeight: FontWeight.w500),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: Size(50, 50),
                side: BorderSide(
                  color: Colors.brown,
                ),
              ),
            ),
          ),
          Positioned(
            top: 560,
            left: 165,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "f",
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.brown,
                    fontWeight: FontWeight.w500),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: Size(50, 50),
                side: BorderSide(
                  color: Colors.brown,
                ),
              ),
            ),
          ),
          Positioned(
            top: 560,
            left: 100,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "G",
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.brown,
                    fontWeight: FontWeight.w500),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: Size(50, 50),
                side: BorderSide(
                  color: Colors.brown,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
