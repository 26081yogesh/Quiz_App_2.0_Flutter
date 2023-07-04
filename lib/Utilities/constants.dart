import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kButtonStyles = ButtonStyle(
  backgroundColor: const MaterialStatePropertyAll(Colors.red),
  padding: const MaterialStatePropertyAll(
    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  ),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  elevation: const MaterialStatePropertyAll(10),
);

var kQuestionsTextStyle = GoogleFonts.inconsolata(
  color: Colors.white,
  fontSize: 20,
);
