import 'package:flutter/material.dart';

class AppColorValues{
  final primaryColor = 0xff486A7F;
  final secondaryColor = 0xff1F3B4D;
  final thirdColor = 0xffA9BECC;
  final backgroundColor = 0XFFFFFFFF;
  final cardColor = 0xff648499;
}

final AppColorValues mainColorValues = AppColorValues();
// final SwatchColors swatchColors = SwatchColors();

final lightThemeData = ThemeData(
    primaryColor: Color(mainColorValues.primaryColor),
    primaryColorDark: Color(mainColorValues.secondaryColor),
    primaryColorLight: Color(mainColorValues.thirdColor),
    primarySwatch: Colors.teal,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    backgroundColor: Color(mainColorValues.backgroundColor),
    cardColor: Color(mainColorValues.cardColor),
    // floatingActionButtonTheme:  FloatingActionButtonThemeData(
    //     foregroundColor: Color(mainColorValues.secondaryColor),
    //     backgroundColor: swatchColors.lightPrimarySwatch[600]
    // ),

    tabBarTheme: TabBarTheme(
      labelColor: Color(mainColorValues.secondaryColor),
      labelStyle: TextStyle(fontFamily: 'Messiri', fontWeight: FontWeight.bold, fontSize: 12, color: Color(mainColorValues.secondaryColor)),
      unselectedLabelColor: Colors.black54,
      unselectedLabelStyle: TextStyle(fontFamily: 'Messiri', fontSize: 13, color: Color(mainColorValues.secondaryColor)),
    ),
    textTheme: TextTheme(
        headline5: TextStyle(fontFamily: 'Messiri', fontWeight: FontWeight.bold, color: Color(mainColorValues.secondaryColor)),
        headline6: TextStyle(fontFamily: 'Messiri', color: Color(mainColorValues.secondaryColor)),
        subtitle1: TextStyle(fontFamily: 'Messiri', fontSize: 18, color: Color(mainColorValues.secondaryColor)),
        subtitle2: TextStyle(fontFamily: 'Messiri', fontSize: 16,fontWeight: FontWeight.bold, color: Color(mainColorValues.secondaryColor)),
        bodyText1: TextStyle(fontFamily: 'Messiri', fontSize: 14, color: Color(mainColorValues.secondaryColor))
    ),
    buttonTheme: ButtonThemeData(buttonColor: Color(mainColorValues.secondaryColor)),
    indicatorColor: Color(mainColorValues.primaryColor)
);