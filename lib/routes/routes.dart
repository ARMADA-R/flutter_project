import 'package:experienceapp/screens/Form.dart';
import 'package:experienceapp/screens/forgetPassword.dart';
import 'package:experienceapp/screens/introduction_screen.dart';
import 'package:experienceapp/screens/profileScreen.dart';
import 'package:experienceapp/screens/public_messages_forms.dart';
import 'package:experienceapp/screens/registeration_screen.dart';
import 'package:experienceapp/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import '/screens/login_screen.dart';
import '../screens/HomeScreen.dart';

Map<String, WidgetBuilder>   routes =  <String, WidgetBuilder> {
  LogInScreen.routeName : (context) => LogInScreen(title: 'LogInScreen',),
  MySchool.routeName :(context) => MySchool(title: 'MySchool',),
  MyRegistrationScreen.routeName :(context) => MyRegistrationScreen(title: 'MyRegistrationScreen',),
 // Splash.routeName :(context) => Splash(),
  IntroScreen.routeName :(context) => IntroScreen(title: 'IntroScreen',),
  ForgetPasswordScreen.routeName :(context) => ForgetPasswordScreen(title: 'ForgetPassword',),
  ProfileScreen.routeName :(context) => ProfileScreen(title: 'ProfileScreen',),
  PublicMessagesForms.routeName :(context) => PublicMessagesForms(title: 'PublicMessagesForms',),
  UserForm.routeName :(context) => UserForm(title: 'UserForm',),

};