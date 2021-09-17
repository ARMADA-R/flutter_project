import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/screens/login_screen.dart';
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
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // String lang = AppDeterminants().lang;
  String? lang;

  // langfun() async {
  //
  //   print(await AppDeterminants().lang);
  //   return await AppDeterminants().lang;
  // }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      this.lang = await AppDeterminants().lang;
      S.load(Locale(this.lang!));
    });

    return MaterialApp(
      //home: InputScreen(),
      debugShowCheckedModeBanner: false,
//      initialRoute: Splash.routeName,
      routes: routes,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      home: FutureBuilder(
        future: AppDeterminants().lang,
          builder: (context, snapshot) {
            if (snapshot.hasData){
              S.load(Locale(snapshot.data as String));
            }

            return Splash();

      }),
    );
  }
}
