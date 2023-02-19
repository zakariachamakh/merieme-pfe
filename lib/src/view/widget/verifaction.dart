import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: 125,
            child: Text(
              "Verification",
              style:
                  GoogleFonts.inter(fontSize: 29, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 160,
            left: 50,
            child: Text(
              textAlign: TextAlign.center,
              "Please input your verification number",
              style: GoogleFonts.inter(
                  color: Colors.black45,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Positioned(
            top: 240,
            width: 400,
            left: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Number(),
                Number(),
                Number(),
                Number(),
              ],
            ),
          ),
          Positioned(
            top: 370,
            left: 120,
            child: ElevatedButton(
              child: Text(
                "Resend the code",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: Color(0xff9775FA),
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: () {},
              style: ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(
                  Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            top: 340,
            left: 70,
            child: Text(
              "Didn’t recive a verification code?",
              style: GoogleFonts.inter(color: Colors.black38, fontSize: 18),
            ),
          ),
          Positioned(
            top: 570,
            left: 310,
            child: SizedBox(
              width: 60,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(6),
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xff9775FA),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Color(0xff9775FA),
                      content: Container(
                        child: Stack(
                          children: [
                            Positioned(
                              top: 20,
                              left: 120,
                              child: Icon(
                                Icons.check_circle,
                                size: 45,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              left: 30,
                              top: 75,
                              child: Text(
                                "Verification Success",
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Positioned(
                              top: 115,
                              child: Text(
                                "Verification is succes and now you can use\n the app full ",
                                style: GoogleFonts.inter(
                                    color: Colors.white, fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        width: 500.0,
                        height: 200.0,
                      ),
                    ),
                  );
                },
                child: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Number extends StatelessWidget {
  const Number({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 60,
        height: 60,
        child: TextFormField(
          onEditingComplete: () {
            print("toto");
          },
          cursorColor: Color(0xff9775FA),
          decoration: InputDecoration(
            hintText: '*',
          ),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w300,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            if (value.length == 1) FocusScope.of(context).nextFocus();
            if (value.isEmpty) FocusScope.of(context).previousFocus();
          },
          onSaved: (value) {},
        ),
      ),
    );
  }
}
