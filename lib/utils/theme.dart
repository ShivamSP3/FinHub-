import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(color: Colors.white),
      primaryColor: Colors.black,
      primaryColorDark: Colors.black,
      primaryColorLight: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
          titleLarge: GoogleFonts.montserrat(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),

    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(color: Colors.amber),
        primaryColor: Colors.white,
      primaryColorDark: Colors.grey,
      primaryColorLight: Colors.blue,
      scaffoldBackgroundColor: Colors.grey,
      textTheme: TextTheme(
          titleLarge: GoogleFonts.montserrat(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
