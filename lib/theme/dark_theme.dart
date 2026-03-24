import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  useMaterial3: false,
  fontFamily: 'Ubuntu',
  primaryColor: const Color(0xFF010D15),
  primaryColorLight: const Color(0xFFF0F4F8),
  primaryColorDark: const Color(0xFF10324A),
  secondaryHeaderColor: const Color(0xFFC38DDA),
  disabledColor: const Color(0xFF8797AB),
  scaffoldBackgroundColor: const Color(0xFF151515),
  brightness: Brightness.dark,
  hintColor: const Color(0xFFC0BFBF),
  focusColor: const Color(0xFF484848),
  hoverColor: const Color(0xFFBB9BCC),
  shadowColor: const Color(0x33e2f1ff),
  cardColor: const Color(0xFF10324A),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFFFFFFFF))), colorScheme: const ColorScheme.dark(
      primary: Color(0xFF531273),
      secondary: Color(0xFFf57d00),
      onSecondaryContainer: Color(0xFF02AA05),
      tertiary: (Color(0xFFFF6767) ),
      error: (Color(0xFFBC4040) ),
      onPrimary: Color(0xff173451),
  ).copyWith(surface: const Color(0xff010D15)),
);