import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_mobile/VIew/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OMobile',
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: GoogleFonts.montserrat(),
          titleMedium: GoogleFonts.montserrat(),
          bodyMedium: GoogleFonts.montserrat(),
        ),
      ),
      initialRoute: '/loginPage',
      routes: {
        '/loginPage': (context) => LoginPage(),
      },
    );
  }
}
