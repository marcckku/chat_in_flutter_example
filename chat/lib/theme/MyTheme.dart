import 'dart:ui';
import 'package:flutter/material.dart';




class MyTheme {
  static const Color primaryColor = Color(0xFFFC2F34);
  static const Color primaryColorShadow = Color(0x88FC2F34);
  static const Color helpPageSearchBar = Color(0xFFEFF2F7);
  static const Color greyCard = Color(0xFFEFF2F7);
  static const Color helpPageSearchBarIcon = Color(0xFF2F86FB);
  static const Color onBoardingButtonBorder = Color(0xFFF52D32);
  static const Color canvasColor = Color(0xFFFDFDFF);
}

ThemeData appTheme() {
  Color _appWhite = Color(0xFFFDFDFF); //CUSTOM WHITE
  Color _textColor = Color(0xFF000000);
  Color _disableColor = Colors.grey;

  return ThemeData(
      primaryColor: colorsPrimary,
      backgroundColor: _appWhite,
      buttonColor: Color(0xFFFC2F34),
      disabledColor: _disableColor,
      scaffoldBackgroundColor: _appWhite,
      accentColor: Color(0xFF000000),
      canvasColor: _appWhite,
      fontFamily: 'Avenir Next',
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 39.0,
            fontWeight: FontWeight.normal,
            color: _textColor,
            letterSpacing: 0),
        headline2: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
            color: _textColor,
            letterSpacing: 0),
        headline3: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 0.0),
        headline4: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 0),
        headline5: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.normal,
            color: Colors.black,
            letterSpacing: 0),
        headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
            color: _textColor,
            letterSpacing: 0),
        subtitle1: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
            color: _disableColor,
            letterSpacing: 0.15),
        subtitle2: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.normal,
            color: _textColor,
            letterSpacing: 0.1),
        bodyText1: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: _textColor,
            letterSpacing: 0.5),
        bodyText2: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
            color: Colors.black,
            height: 1.2
        ),
        button: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: _appWhite,
            letterSpacing: 1.25),
      ),
      cardColor: _appWhite,

      textSelectionColor: Colors.black,
      hintColor: Colors.white54,
      dividerColor: Colors.black.withOpacity(0.09),
      //SHADOWS
      dialogBackgroundColor:
      Colors.black.withOpacity(0.20) // SHADOWS CATEGORY BUTTON
  );
}



Map<int, Color> primaryColorCustom =
{
  50: Color.fromRGBO(252, 47, 52, .1),
  100:Color.fromRGBO(252, 47, 52, .2),
  200:Color.fromRGBO(252, 47, 52, .3),
  300:Color.fromRGBO(252, 47, 52, .4),
  400:Color.fromRGBO(252, 47, 52, .5),
  500:Color.fromRGBO(252, 47, 52, .6),
  600:Color.fromRGBO(252, 47, 52, .7),
  700:Color.fromRGBO(252, 47, 52, .8),
  800:Color.fromRGBO(252, 47, 52, .9),
  900:Color.fromRGBO(252, 47, 52, 1),
};

MaterialColor colorsPrimary = MaterialColor(0xFFFC2F34, primaryColorCustom);

Color lightGreyLines = Color(0xFFEFEFEF);



BoxShadow shadow = BoxShadow(
  color: Color(0xFF26346B).withOpacity(0.06),
  blurRadius: 8.0,
  spreadRadius: 0.0,
  offset: Offset(0.0, 0.0), // shadow direction: bottom right
);

BoxShadow inputTextShadow = BoxShadow(
  color: Color(0xFF26346B).withOpacity(0.1),
  blurRadius: 8.0,
  spreadRadius: 0.0,
  offset: Offset(0.0, 0.0),  // shadow direction: bottom right
);


BoxShadow cardshadow = BoxShadow(
  color: Color(0xFF26346B).withOpacity(0.1),
  blurRadius: 8.0,
  spreadRadius: 0.0,
  offset: Offset(0.0, 0.0), // shadow direction: bottom right
);

BorderRadius generalRadius = BorderRadius.circular(8.0);