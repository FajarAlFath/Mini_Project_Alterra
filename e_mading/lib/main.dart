import 'package:e_mading/components/constants.dart';
import 'package:e_mading/screens/login/login.dart';
import 'package:e_mading/screens/onboarding1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoarding(),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnBoarding(),
        '/login': (context) => const LoginScreen(),
      },
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
    );
  }
}
