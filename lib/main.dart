import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/screens/introduction_screen.dart';
import 'package:experienceapp/screens/login_screen.dart';
import 'package:experienceapp/screens/profileScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'package:flutter/material.dart';
import 'routes/routes.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppDeterminants(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  AppDeterminants appDeterminants = AppDeterminants();
  String? lang;

  // langfun() async {
  //
  //   print(await AppDeterminants().lang);
  //   return await AppDeterminants().lang;
  // }

  @override
  Widget build(BuildContext context) {
//    Future.delayed(Duration.zero, () async {
//      this.lang = await AppDeterminants().lang;
//      S.load(Locale(this.lang!));
//    });

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
        future: appDeterminants.initializeAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              S.load(Locale(appDeterminants.lang));
             if(appDeterminants.isLunched){

               if(appDeterminants.token != "" && DateTime.fromMillisecondsSinceEpoch(int.parse(appDeterminants.loginAt)).isAfter( DateTime.now().subtract(const Duration(days: 3)))){
                 return ProfileScreen(title: appDeterminants.userName);
               }
               return LogInScreen(title: 'LoginScreen');
             }
             else return IntroScreen(title: 'IntroScreen',);
            }

            return Center(
              child: Icon(Icons.school) ,

            );

            }),
    );
  }
}
