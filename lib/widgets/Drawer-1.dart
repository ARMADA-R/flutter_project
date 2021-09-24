import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/screens/Electronic_Forms.dart';
import 'package:experienceapp/screens/Electronic_Questionnaire.dart';
import 'package:experienceapp/screens/GeneralTableScreen.dart';
import 'package:experienceapp/screens/MailingManagementScreen.dart';
import 'package:experienceapp/screens/MailingManagerScreen.dart';
import 'package:experienceapp/screens/SchoolExamTable.dart';
import 'package:experienceapp/screens/paretners_offers.dart';
import 'package:experienceapp/screens/profileScreen.dart';
import 'package:experienceapp/screens/public_messages_forms.dart';
import 'package:experienceapp/screens/registeration_screen.dart';
import 'package:flutter/material.dart';
import '/screens/login_screen.dart';
import 'package:http/http.dart';

class Drawer1 extends StatelessWidget {
  _buildDrawer(Icon icon, String title, Function() onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      onTap: onTap,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Card(child: Text(S.of(context).SchoolManagement,style: TextStyle(fontSize: 25),),),
          _buildDrawer(Icon(Icons.table_chart_outlined), S.of(context).ExamsTable, () {
            Navigator.pushReplacementNamed(context, SchoolExamsTable.routeName);
          }),
          _buildDrawer(
              Icon(Icons.table_chart_outlined), S.of(context).GeneralTable, () {
            Navigator.pushNamed(context, GeneralTableScreen.routeName);
          }),
          _buildDrawer(
              Icon(Icons.description), S.of(context).ElectronicQuestionnaires, () {
           Navigator.pushNamed(context, ElectronicQuestionnaires.routeName);
          }),
          _buildDrawer(
              Icon(Icons.description), S.of(context).ElectronicForms, () {
           Navigator.pushNamed(context, ElectronicForms.routeName);
          }),
          _buildDrawer(
              Icon(Icons.description), S.of(context).SchoolAlerts, () {
       //    Navigator.pushNamed(context, ElectronicForms.routeName);
          }),
          Card(child: Text(S.of(context).TechnicalSupport,style: TextStyle(fontSize: 25),),),
          _buildDrawer(
              Icon(Icons.description), S.of(context).MailingTheManager, () {
             Navigator.pushNamed(context, MailingManagerScreen.routeName);
          }),
          _buildDrawer(
              Icon(Icons.description), S.of(context).MailingTheManagement, () {
             Navigator.pushNamed(context, MailingManagementScreen.routeName);
          }),

          Card(child: Text(S.of(context).Partners,style: TextStyle(fontSize: 25),),),
          _buildDrawer(
              Icon(Icons.description), S.of(context).PartnersOffers, () {
            Navigator.pushNamed(context, PartnersOffers.routeName);
          }),


          _buildDrawer(
              Icon(Icons.logout), S.of(context).logout, () {
            AppDeterminants().setUsername('');
            AppDeterminants().setToken('');
            AppDeterminants().setUserId('');
            Navigator.pushReplacementNamed(context, LogInScreen.routeName);

          }),

        ],
      ),
    );
  }
}
