import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key, required this.title}) : super(key: key);
  final String title;
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
      body: AnimatedSplashScreen(
        nextScreen: MySchool(title: 'MySchool',),
        splash: Icons.school,
        duration: 3000,
      ),
    );
  }
}
