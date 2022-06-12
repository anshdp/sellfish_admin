import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPassCode extends StatelessWidget {
  CustomPassCode({Key? key, required this.linkText}) : super(key: key);
  String linkText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        linkText,
        style: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }
}
