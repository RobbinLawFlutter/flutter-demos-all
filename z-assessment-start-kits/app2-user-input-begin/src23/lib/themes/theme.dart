//https://api.flutter.dev/flutter/material/ButtonStyle-class.html

//https://material.io/design/interaction/states.html#usage

//https://material.io/design/material-theming/implementing-your-theme.html#theming

//https://docs.google.com/document/d/1kzIOQN4QYfVsc5lMZgy_A-FWGXBAJBMySGqZqsJytcE/edit#heading=h.pub7jnop54q0

import 'package:flutter/material.dart';

final ThemeData base = ThemeData.light();

ThemeData buildTheme() {
  return base.copyWith(
    colorScheme: _colorScheme,
    textTheme: _buildTextTheme(base.textTheme),
    iconTheme: _buildIconTheme(base.iconTheme),
    appBarTheme: _buildAppBarTheme(base.appBarTheme),
    checkboxTheme: _buildCheckboxThemeData(base.checkboxTheme),
    textButtonTheme: _buildTextButtonThemeData(base.textButtonTheme),
    elevatedButtonTheme:
        _buildElevatedButtonThemeData(base.elevatedButtonTheme),
    dialogTheme: _buildDialogTheme(base.dialogTheme),
    //inputDecorationTheme applies to TextField Widget.
    inputDecorationTheme: _buildInputDecorationTheme(base.inputDecorationTheme),
    textSelectionTheme: _textSelectionThemeData(),
  );
}

AppBarTheme _buildAppBarTheme(AppBarTheme original) {
  return original.copyWith(
    color: _colorScheme.primary,
    titleTextStyle: _buildTextStyle(
      _colorScheme.onPrimary,
      //size: 18,
    ),
    centerTitle: true,
  );
}

CheckboxThemeData _buildCheckboxThemeData(CheckboxThemeData original) {
  return CheckboxThemeData(
    fillColor: MaterialStateProperty.all(_colorScheme.onPrimary),
  );
}

TextButtonThemeData _buildTextButtonThemeData(TextButtonThemeData original) {
  return TextButtonThemeData(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(_colorScheme.background),
        foregroundColor: MaterialStateProperty.all(_colorScheme.onPrimary),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            letterSpacing: defaultLetterSpacing,
          ),
        )),
  );
}

ElevatedButtonThemeData _buildElevatedButtonThemeData(
    ElevatedButtonThemeData? original) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
        //The buttons background fill color.
        backgroundColor:
            MaterialStateProperty.resolveWith<Color>(_getBackgroundColor),
        //The color of the buttons text and icon descendant widgets.
        foregroundColor:
            MaterialStateProperty.resolveWith<Color>(_getForegroundColor),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
            letterSpacing: defaultLetterSpacing,
          ),
        )),
  );
}

DialogTheme _buildDialogTheme(DialogTheme original) {
  return original.copyWith(
    backgroundColor: Colors.white,
    titleTextStyle: _buildTextStyle(_colorScheme.onPrimary, size: 25),
    contentTextStyle: _buildTextStyle(_colorScheme.onPrimary, size: 25),
  );
}

InputDecorationTheme _buildInputDecorationTheme(InputDecorationTheme original) {
  return original.copyWith(
    //filled: true,
    fillColor: _colorScheme.primary,
    focusColor: _colorScheme.onPrimary,
    contentPadding: const EdgeInsets.all(16),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    //floatingLabelBehavior: FloatingLabelBehavior.auto,
    //constraints: BoxConstraints(maxWidth: 150),
    // borders
    enabledBorder: _buildBorderStyle(_colorScheme.primary),
    errorBorder: _buildBorderStyle(_colorScheme.error),
    focusedErrorBorder: _buildBorderStyle(_colorScheme.error),
    focusedBorder: _buildBorderStyle(_colorScheme.primary),
    disabledBorder: _buildBorderStyle(Colors.black26),
    // text
    suffixStyle: _buildTextStyle(_colorScheme.onPrimary),
    counterStyle: _buildTextStyle(_colorScheme.onPrimary, size: 12.0),
    floatingLabelStyle: _buildTextStyle(_colorScheme.onPrimary),
    errorStyle: _buildTextStyle(_colorScheme.error),
    hintStyle: _buildTextStyle(_colorScheme.onPrimary),
    helperStyle: _buildTextStyle(_colorScheme.onPrimary),
    labelStyle: _buildTextStyle(_colorScheme.onPrimary),
    prefixStyle: _buildTextStyle(_colorScheme.onPrimary),
    // icons
    iconColor: _colorScheme.onPrimary,
  );
}

OutlineInputBorder _buildBorderStyle(Color color,
    {double width = 2.0, Radius borderRadius = const Radius.circular(10)}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(borderRadius),
    borderSide: BorderSide(
      color: color,
      width: width,
    ),
  );
}

IconThemeData _buildIconTheme(IconThemeData original) {
  return original.copyWith(color: _colorScheme.onPrimary);
}

TextStyle _buildTextStyle(Color color,
    {double size = 16.0, FontWeight weight = FontWeight.w500}) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontWeight: weight,
    letterSpacing: defaultLetterSpacing,
  );
}

TextSelectionThemeData _textSelectionThemeData() {
  return TextSelectionThemeData(
    cursorColor: _colorScheme.onPrimary,
  );
}

TextTheme _buildTextTheme(TextTheme original) {
  return original
      .copyWith(
        //Extremely large text.
        headline1: _buildTextStyle(Colors.green),
        //Very, very large text.
        headline2: _buildTextStyle(Colors.green),
        //Very large text.
        headline3: _buildTextStyle(Colors.green),
        //Large text.
        headline4: _buildTextStyle(Colors.green),
        //Used for large text in dialogs
        //(e.g., the month and year in the dialog shown by showDatePicker)
        headline5: _buildTextStyle(Colors.green),
        //Used for the primary text in app bars and dialogs
        //(e.g., AppBar.title and AlertDialog.title).
        headline6: _buildTextStyle(Colors.purple),
        //Used for the primary text in lists (e.g., ListTile.title)
        //and the TextField edited text.
        subtitle1: _buildTextStyle(Colors.amber),
        //For medium emphasis text that's a little smaller than subtitle1
        subtitle2: _buildTextStyle(Colors.cyan),
        //Used for emphasizing text that would otherwise be bodyText2.
        bodyText1: _buildTextStyle(Colors.blue),
        //The default text style for material.
        //Color for ListTile.trailing
        bodyText2: _buildTextStyle(Colors.green),
        //Used for auxiliary text with images.
        //Used for ListTile.subtile
        caption: _buildTextStyle(Colors.green),
        //Used for text on ElevatedButton, TextButton, and OutlinedButton
        //if no others
        button: _buildTextStyle(Colors.green),
      )
      .apply(
        fontFamily: 'Rubik',
        //The displayColor is applied to [headline4], [headline3],
        //[headline2], [headline1], and [caption]
        displayColor: _colorScheme.onPrimary,
        //The bodyColor is applied to the remaining text styles.
        bodyColor: _colorScheme.onPrimary,
      );
}

Color _getBackgroundColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return _colorScheme.primary.withOpacity(0.5);
  }
  return _colorScheme.primary;
}

Color _getForegroundColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return _colorScheme.onPrimary.withOpacity(0.5);
  }
  return _colorScheme.onPrimary;
}

const ColorScheme _colorScheme = ColorScheme(
  //primary: blue200,
  primary: pink100,
  onPrimary: brown900,
  secondary: pink50,
  onSecondary: brown900,
  surface: surfaceWhite,
  onSurface: brown900,
  background: backgroundWhite,
  onBackground: brown900,
  error: errorRed,
  onError: surfaceWhite,
  brightness: Brightness.light,
);

const Color blue200 = Color(0xFF80DEEA);

const Color pink50 = Color(0xFFFEEAE6);
const Color pink100 = Color(0xFFFEDBD0);
const Color pink300 = Color(0xFFFBB8AC);
const Color pink400 = Color(0xFFEAA4A4);

const Color brown900 = Color(0xFF442B2D);
const Color brown600 = Color(0xFF7D4F52);

const Color errorRed = Color(0xFFC5032B);

const Color surfaceWhite = Color(0xFFFFFBFA);
const Color backgroundWhite = Colors.white;

const defaultLetterSpacing = 0.09;
