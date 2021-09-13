import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/l10n.dart';
import 'screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'widgets/mainDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: InputScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: MySchool.routeName,
      routes: routes,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate
      ],
    );
  }
}
