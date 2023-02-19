import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../widget/form_lsingup.dart';
import 'intro_screen.dart';
import 'loging.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 120,
            left: 140,
            child: Text(
              "Sign Up",
              style:
                  GoogleFonts.inter(fontSize: 29, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 180,
            left: 16,
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
            top: 240,
            left: 24,
            width: 340,
            child: FormSignup(),
          ),
          Positioned(
            top: 570,
            left: 45,
            child: Row(children: [
              Text(
                "Already have an account?",
                style: GoogleFonts.inter(color: Colors.black38, fontSize: 18),
              ),
              ElevatedButton(
                child: Text(
                  "Login",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.brown.shade500,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Login(),
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
            top: 610,
            left: 90,
            child: Text(
              "Sign In with social media",
              style: GoogleFonts.inter(color: Colors.black38, fontSize: 18),
            ),
          ),
          Positioned(
            top: 650,
            left: 230,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "t",
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.brown.shade400,
                    fontWeight: FontWeight.w500),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: Size(50, 50),
                side: BorderSide(
                  color: Colors.brown.shade900,
                ),
              ),
            ),
          ),
          Positioned(
            top: 650,
            left: 165,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "f",
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.brown.shade400,
                    fontWeight: FontWeight.w500),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: Size(50, 50),
                side: BorderSide(
                  color: Colors.brown.shade900,
                ),
              ),
            ),
          ),
          Positioned(
            top: 650,
            left: 100,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "G",
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.brown.shade400,
                    fontWeight: FontWeight.w500),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: Size(50, 50),
                side: BorderSide(
                  color: Colors.brown.shade900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
