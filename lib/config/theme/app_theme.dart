import 'package:flutter/material.dart';

class AppTheme {

  ThemeData getTheme() {
    const seeColor = Colors.deepPurple;
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seeColor,
      listTileTheme: const ListTileThemeData(
        iconColor: seeColor
      )

    );
  }
}