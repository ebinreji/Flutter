import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme{
  static const lightThemeFont = "Comic Neue", darkThemeFont='Poppies';
  static final lightTheme=ThemeData(
    primaryColor: lightThemeColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    fontFamily: lightThemeFont,
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>((states)=>lightThemeColor)
    ),
    appBarTheme: AppBarTheme(centerTitle: true,
    backgroundColor: Colors.white,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontSize: 23,

    ),
      iconTheme: IconThemeData(color: lightThemeColor),
      elevation: 0,
      actionsIconTheme: IconThemeData(color: lightThemeColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    )

  );
  static final darkTheme = ThemeData(
    primaryColor: darkThemeColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: black,
    useMaterial3: true,
    fontFamily: darkThemeFont,switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.resolveWith<Color>((states)=>darkThemeColor),
  ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: black,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: white,
        fontSize: 25,
      ),
      iconTheme: IconThemeData(color: darkThemeColor),
      elevation: 0,
      actionsIconTheme: IconThemeData(color: darkThemeColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: black,
        statusBarIconBrightness: Brightness.light,
      )
    )
  );
  static Color lightThemeColor =Colors.red,
  white=Colors.white,
  black=Colors.black,
  darkThemeColor=Colors.yellow;
}