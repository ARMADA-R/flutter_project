import 'package:experienceapp/screens/Electronic_Forms.dart';
import 'package:experienceapp/screens/Electronic_Questionnaire.dart';
import 'package:experienceapp/screens/GeneralTableScreen.dart';
import 'package:experienceapp/screens/MailingSchoolManagementScreen.dart';
import 'package:experienceapp/screens/MailingManagerScreen.dart';
import 'package:experienceapp/screens/NewParentManagerTicket.dart';
import 'package:experienceapp/screens/NewParentSchoolTicket.dart';
import 'package:experienceapp/screens/SchoolExamTable.dart';
import 'package:experienceapp/screens/introduction_screen.dart';
import 'package:experienceapp/screens/loginScreenEx.dart';
import 'package:experienceapp/screens/paretners_offers.dart';
import 'package:experienceapp/screens/registration_screen.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder>   routes =  <String, WidgetBuilder> {
//  LogInScreen.routeName : (context) => LogInScreen(title: 'LogInScreen',),
  MyRegistrationScreen.routeName :(context) => MyRegistrationScreen(title: 'MyRegistrationScreen',),
 // Splash.routeName :(context) => Splash(),
  IntroScreen.routeName :(context) => IntroScreen(title: 'IntroScreen',),
  //ForgetPasswordScreen.routeName :(context) => ForgetPasswordScreen(title: 'ForgetPassword',),
  SchoolExamsTable.routeName :(context) => SchoolExamsTable(title: 'SchoolExamsTable',),
  GeneralTableScreen.routeName :(context) => GeneralTableScreen(title: 'GeneralTableScreen',),
  ElectronicForms.routeName :(context) => ElectronicForms(title: 'ElectronicForms',),
  ElectronicQuestionnaires.routeName :(context) => ElectronicQuestionnaires(title: 'ElectronicQuestionnaires',),
  MailingManagerScreen.routeName :(context) => MailingManagerScreen(title: 'MailingManagerScreen',),
  MailingSchoolManagementScreen.routeName :(context) => MailingSchoolManagementScreen(title: 'MailingSchoolManagementScreen',),
  NewParentManagerTicket.routeName :(context) => NewParentManagerTicket(title: 'NewParentManagerTicket',),
  PartnersOffers.routeName :(context) => PartnersOffers(title: 'PartnersOffers',),
  NewParentSchoolTicket.routeName :(context) => NewParentSchoolTicket(),
  LogInScreen.routeName :(context) => LogInScreen(),
};