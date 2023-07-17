//import 'package:dhulikona_app/screen1.dart';
import 'package:dhulikona_app/stream_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            textTheme:
                GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme)),
        home: StreamScreen());
  }
}
