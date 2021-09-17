
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/screens/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'HomeScreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static final String routeName = 'Splash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState(){
    super.initState();
 //   _navigateToHome();


  }


//  _navigateToHome() async{
//    await Future.delayed(Duration(milliseconds: 1500),(){});
//    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MySchool(title: 'MySchool',)));
//  }

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: SplashScreen(
          navigateAfterFuture: AppDeterminants().initializeAll(),

          title: new Text('Welcome In SplashScreen',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
            ),),
          image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 100.0,
          onClick: ()=>print("Flutter Egypt"),
          loaderColor: Colors.red
        // nextScreen: IntroScreen(title: 'IntroScreen',),
        // splash: Icons.school,
        // duration: 1000,
      ),
    );
  }
}
