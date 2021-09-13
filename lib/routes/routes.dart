import 'package:experienceapp/screens/registeration_screen.dart';
import 'package:flutter/material.dart';
import '/screens/login_screen.dart';
import '../screens/HomeScreen.dart';

Map<String, WidgetBuilder>   routes =  <String, WidgetBuilder> {
  LogInScreen.routeName : (context) => LogInScreen(title: 'LogInScreen',),
  MySchool.routeName :(context) => MySchool(title: 'MySchool',),
  MyRegistrationScreen.routeName :(context) => MyRegistrationScreen(title: 'MyRegistrationScreen',),

};