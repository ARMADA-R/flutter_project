import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/screens/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/l10n.dart';
import 'screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'widgets/mainDrawer.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppDeterminants(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  @override
  Widget build(BuildContext context) {
//    S.load(Locale(Provider.of<AppDeterminants>(context).lang));
    return MaterialApp(
      //home: InputScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.routeName,
      routes: routes,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
    );
  }
}
