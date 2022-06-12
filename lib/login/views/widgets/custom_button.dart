import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.buttonName}) : super(key: key);
  String buttonName;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 140),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.greenAccent,
      child: Text(
        buttonName,
        style: GoogleFonts.montserrat(
          fontSize: 16,
          color: Colors.white,
          letterSpacing: 0.168,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
