import 'package:better_help/features/nickname_screen.dart';
import 'package:better_help/features/user_type_screen.dart';
import 'package:better_help/features/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/screens.dart';
import 'generated/i18n.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      onGenerateTitle: (BuildContext context) => S.of(context).app_name,
      localizationsDelegates: const <LocalizationsDelegate>[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback:
          S.delegate.resolution(fallback: const Locale('en', '')),
      localeListResolutionCallback:
          S.delegate.listResolution(fallback: const Locale('en', '')),
      theme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
        primaryColor: Colors.black,
        textStyle: TextStyle(),
      )),
      routes: {
        Screens.WELCOME.toString(): (context) => WelcomeScreen(),
        Screens.NICKNAME.toString(): (context) => NicknameScreen(),
        Screens.USER_TYPE.toString(): (context) => UserTypeScreen(),
      },
      // initialRoute: Screens.WELCOME.toString(),
      onGenerateRoute: (settings) =>
          CupertinoPageRoute(
              settings: settings,
              builder: (context) => WelcomeScreen()),
    );
  }
}
