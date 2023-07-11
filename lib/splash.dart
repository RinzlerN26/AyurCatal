import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ayurcatal/widgets/medicine_list.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const MedicinalList())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 11, 59),
      body: Center(
        child: Text('AyurCatal',
        style: GoogleFonts.montserrat(
           fontSize: 30,
           fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }
}