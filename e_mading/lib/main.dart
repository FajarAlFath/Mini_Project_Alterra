import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:e_mading/components/constants.dart';
import 'package:e_mading/screens/login/login.dart';
import 'package:e_mading/screens/news/navbar.dart';
import 'package:e_mading/screens/onboarding1.dart';
import 'package:e_mading/screens/profile/components/themes.dart';
import 'package:e_mading/screens/profile/components/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const OnBoarding(),
        initialRoute: '/onboarding',
        routes: {
          '/onboarding': (context) => const OnBoarding(),
          '/login': (context) => const LoginScreen(),
          '/navbar': (context) => const News1(),
        },
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            textTheme:
                GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
      ),
    );
  }
}
