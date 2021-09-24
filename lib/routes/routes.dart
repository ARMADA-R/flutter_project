import 'package:experienceapp/screens/Electronic_Forms.dart';
import 'package:experienceapp/screens/Electronic_Questionnaire.dart';
import 'package:experienceapp/screens/Form.dart';
import 'package:experienceapp/screens/GeneralTableScreen.dart';
import 'package:experienceapp/screens/MailingManagementScreen.dart';
import 'package:experienceapp/screens/MailingManagerScreen.dart';
import 'package:experienceapp/screens/NewMessage.dart';
import 'package:experienceapp/screens/SchoolExamTable.dart';
import 'package:experienceapp/screens/forgetPassword.dart';
import 'package:experienceapp/screens/introduction_screen.dart';
import 'package:experienceapp/screens/paretners_offers.dart';
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
  SchoolExamsTable.routeName :(context) => SchoolExamsTable(title: 'SchoolExamsTable',),
  GeneralTableScreen.routeName :(context) => GeneralTableScreen(title: 'GeneralTableScreen',),
  ElectronicForms.routeName :(context) => ElectronicForms(title: 'ElectronicForms',),
  ElectronicQuestionnaires.routeName :(context) => ElectronicQuestionnaires(title: 'ElectronicQuestionnaires',),
  MailingManagerScreen.routeName :(context) => MailingManagerScreen(title: 'MailingManagerScreen',),
  MailingManagementScreen.routeName :(context) => MailingManagementScreen(title: 'MailingManagementScreen',),
  NewMessageScreen.routeName :(context) => NewMessageScreen(title: 'NewMessageScreen',),
  PartnersOffers.routeName :(context) => PartnersOffers(title: 'PartnersOffers',),
};