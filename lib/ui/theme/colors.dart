import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyColors {
  static int header01 = 0xff151a56;
  static int primary = 0xff575de3;
  static int purple01 = 0xff918fa5;
  static int purple02 = 0xff6b6e97;
  static int yellow01 = 0xffeaa63b;
  static int yellow02 = 0xfff29b2b;
  static int bg = 0xfff5f3fe;
  static int bg01 = 0xff6f75e1;
  static int bg02 = 0xffc3c5f8;
  static int bg03 = 0xffe8eafe;
  static int text01 = 0xffbec2fc;
  static int grey01 = 0xffe9ebf0;
  static int grey02 = 0xff9796af;
}


class CustomColors {
  final BuildContext? context;
	final Brightness? brightness;
  const CustomColors(this.context,{this.brightness}) : assert(context != null || brightness != null);

  /// returns whethere the current theme is dark or not
  bool get isDarkTheme {
		// print(Theme.of(context).brightness == Brightness.dark);
		return (brightness??Theme.of(context!).brightness) == Brightness.dark;
	}

  /// for * Light theme: `black` * Dark theme: `white`
  Color get textColor => isDarkTheme ? Colors.white : Colors.black;

  /// for * Light theme: `black` * Dark theme: `white`
  Color get noteColor =>
      isDarkTheme ? const Color.fromARGB(255, 232, 232, 232) : Colors.black54;

  /// for * Light theme: `black` * Dark theme: `white`
  Color get iconColor => isDarkTheme ? Colors.white : Colors.black;

  /// for * Light theme: `white` * Dark theme: `black`
  Color get bgColor => isDarkTheme ? Colors.black : Colors.white;

  /// for * Light theme: `deepPurpleAccent` * Dark theme: `blueAccent`
  Color get accentColor =>
      isDarkTheme ? Colors.deepPurpleAccent : Colors.blueAccent;

  /// for * Dark theme: `black54` * Light theme: `a greyish shade of white`
  Color get expandedTileColor =>
      isDarkTheme ? Colors.black54 : const Color.fromARGB(255, 247, 247, 245);

  /// for * Light theme: `deepOrange` * Dark theme: `pink`
  Color get primaryColor => isDarkTheme ? Colors.pink : Colors.deepOrange;

  /// for * Light theme: `blueGrey.shade900` * Dark theme: `amberAccent`
  Color get markerColor =>
      isDarkTheme ? Colors.amberAccent : Colors.blueGrey.shade900;

  /// for * Light theme: `deepOrange` * Dark theme: `pink`
  Color get buttonColor => isDarkTheme ? Colors.pink : Colors.deepOrange;

  /// for * Light theme: `deepPurpleAccent[700]` * Dark theme: `blueAccent[700]`
  Color get splashColor =>
      isDarkTheme ? Colors.deepPurpleAccent.shade700 : Colors.blueAccent.shade700;

  /// for * Light theme: `deepOrange` * Dark theme: `blue`
  Color get dateAvatarColor => isDarkTheme ? Colors.deepOrange : Colors.blue;

  /// for * Light theme: `deepPurpleAccent` * Dark theme: `blueAccent`
  ///
  /// `NOTE: ` This is same as accentColor
  Color get textSelectionColor =>
      isDarkTheme ? Colors.deepPurpleAccent : Colors.blueAccent;

  /// for * Light theme: `teal` * Dark theme: `green`
  Color get switchToggleColor => isDarkTheme ? Colors.teal : Colors.green;


	String get fontFamily => 'Raleway';
}

class CustomTheme {
  final BuildContext context;

  CustomTheme(this.context);
  ThemeData get lightTheme => defaultTheme(Brightness.light).copyWith(
		appBarTheme: const AppBarTheme().copyWith(
			brightness: Brightness.light,
			iconTheme: const IconThemeData(
				color: Colors.black,
			),
			actionsIconTheme: const IconThemeData(
				color: Colors.black,
			),
			color: Colors.white)
	);
	Brightness get brightness => Theme.of(context).brightness;
	TextStyle getDefaultStyle() => TextStyle(
                fontSize: 20.0,
                color: brightness == Brightness.dark ?Colors.white:Colors.black,
              );

  ThemeData get darkTheme => defaultTheme(Brightness.dark);

	TextStyle get defaultTextStyle => const TextStyle().copyWith(
		fontFamily: 'Raleway',
		fontSize: 20,
		color: CustomColors(context).textColor
	);

	String get defaultFontFamily => 'Raleway';

	ThemeData defaultTheme(Brightness brightness) => ThemeData(
        brightness: brightness,
        fontFamily: 'Raleway',
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          buttonColor: CustomColors(context, brightness: brightness).buttonColor,
					textTheme: ButtonTextTheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          splashColor: Colors.amberAccent,
        ),
				appBarTheme: const AppBarTheme().copyWith(
					color: CustomColors(context, brightness: brightness).bgColor,
					brightness: brightness,
					textTheme: const TextTheme().copyWith(
						bodyText1: getDefaultStyle(),
						bodyText2: getDefaultStyle(),
						button: getDefaultStyle(),
						caption: getDefaultStyle(),
						headline1: getDefaultStyle(),
						headline2: getDefaultStyle(),
						headline3: getDefaultStyle(),
						headline4: getDefaultStyle(),
						headline5: getDefaultStyle(),
						headline6: getDefaultStyle(),
						overline: getDefaultStyle(),
						subtitle1: getDefaultStyle(),
						subtitle2: getDefaultStyle(),
					)
				),
        splashColor: CustomColors(context, brightness: brightness).splashColor,
        errorColor: Colors.red,
        textSelectionColor: CustomColors(context, brightness: brightness).textSelectionColor,
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(
            fontSize: 20.0,
						fontFamily: defaultFontFamily,
          ),
					unselectedLabelStyle: const TextStyle().copyWith(
						fontSize: 15,
						fontFamily: defaultFontFamily,
					),
          labelColor: CustomColors(context, brightness: brightness).textColor,
        ),
        accentColor: CustomColors(context, brightness: brightness).accentColor,
        toggleableActiveColor: CustomColors(context, brightness: brightness).switchToggleColor,
				// dialogBackgroundColor: CustomColors(context).textColor,
        dialogTheme: DialogTheme(
					backgroundColor: CustomColors(null, brightness: brightness).bgColor,
					titleTextStyle: TextStyle(color: CustomColors(null, brightness: brightness).textColor,
						fontFamily: defaultFontFamily,
						fontSize: 20,
					),
					contentTextStyle: TextStyle(color: CustomColors(null, brightness: brightness).textColor,
						fontFamily: defaultFontFamily
					),
          elevation: 5.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: brightness,
          scaffoldBackgroundColor: CustomColors(context, brightness: brightness).bgColor,
          textTheme: const CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'Raleway',
          )),
          barBackgroundColor: CustomColors(context, brightness: brightness).buttonColor,
        ),
      );
}
