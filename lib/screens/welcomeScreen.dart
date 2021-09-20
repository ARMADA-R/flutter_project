//import 'package:flutter/material.dart';
//import 'login_screen.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';
//import '../widgets/rounded_button.dart';
//
//class WelcomeScreen extends StatefulWidget {
//  static const String id = 'welcome_screen';
//
//  @override
//  _WelcomeScreenState createState() => _WelcomeScreenState();
//}
//
//class _WelcomeScreenState extends State<WelcomeScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.black12,
//      body: Padding(
//        padding: EdgeInsets.symmetric(horizontal: 8.0),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                Container(
//                  child: Image.asset('images/logo.png'),
//                  height: 60.0,
//                ),
//                TypewriterAnimatedTextKit(
//                  text: ['My Beautiful App'],
//                  textStyle: TextStyle(
//                    fontSize: 28.0,
//                    fontWeight: FontWeight.w900,
//                  ),
//                ),
//              ],
//            ),
//            SizedBox(
//              height: 32.0,
//            ),
//            RoundedButton(
//              title: 'Log In',
//              colour: Colors.lightBlueAccent,
//              onPressed: () {
//                Navigator.pushNamed(context, LoginScreen.id);
//              },
//            ),
//            RoundedButton(
//              title: 'Register',
//              colour: Colors.blueAccent,
//              onPressed: () {
//                Navigator.pushNamed(context, RegisterScreen.id);
//              },
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
