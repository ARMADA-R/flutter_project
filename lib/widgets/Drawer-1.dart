import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/screens/Electronic_Forms.dart';
import 'package:experienceapp/screens/Electronic_Questionnaire.dart';
import 'package:experienceapp/screens/GeneralTableScreen.dart';
import 'package:experienceapp/screens/MailingSchoolManagementScreen.dart';
import 'package:experienceapp/screens/MailingManagerScreen.dart';
import 'package:experienceapp/screens/SchoolExamTable.dart';
import 'package:experienceapp/screens/loginScreenEx.dart';
import 'package:experienceapp/screens/paretners_offers.dart';
import 'package:experienceapp/widgets/DrawerClipper.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Drawer1 extends StatelessWidget {
  _buildDrawer(Icon icon, String title, Function() onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 17),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Container(
        color: Colors.blue[50],

        child: Stack(
          children: [
            ClipPath(
                clipper: DrawerClipper(),
                child: Container(
                  color: Colors.white,
                )),
            Column(
              children: [
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            "SMS",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 3,
                        indent: 20,
                        endIndent: 20,
                      ),
                      _buildDrawer(Icon(Icons.table_chart_outlined),
                          S.of(context).ExamsTable, () {
                            Navigator.pushReplacementNamed(
                                context, SchoolExamsTable.routeName);
                          }),
                      _buildDrawer(Icon(Icons.table_chart_outlined),
                          S.of(context).GeneralTable, () {
                            Navigator.pushReplacementNamed(
                                context, GeneralTableScreen.routeName);
                          }),
                      _buildDrawer(Icon(Icons.description),
                          S.of(context).ElectronicQuestionnaires, () {
                            Navigator.pushReplacementNamed(
                                context, ElectronicQuestionnaires.routeName);
                          }),
                      _buildDrawer(
                          Icon(Icons.description), S.of(context).ElectronicForms,
                              () {
                            Navigator.pushReplacementNamed(
                                context, ElectronicForms.routeName);
                          }),

                      // Card(child: Text(S.of(context).TechnicalSupport,style: TextStyle(fontSize: 25),),),
                      Divider(
                        height: 10,
                        thickness: 3,
                        indent: 20,
                        endIndent: 20,
                      ),
                      _buildDrawer(Icon(Icons.description),
                          S.of(context).MailingTheManager, () {
                            Navigator.pushReplacementNamed(
                                context, MailingManagerScreen.routeName);
                          }),
                      _buildDrawer(Icon(Icons.description),
                          S.of(context).MailingTheManagement, () {
                            Navigator.pushReplacementNamed(
                                context, MailingSchoolManagementScreen.routeName);
                          }),

                      Divider(
                        height: 10,
                        thickness: 3,
                        indent: 20,
                        endIndent: 20,
                      ),

                      // Card(child: Text(S.of(context).Partners,style: TextStyle(fontSize: 25),),),
                      _buildDrawer(
                          Icon(Icons.description), S.of(context).PartnersOffers,
                              () {
                            Navigator.pushNamed(context, PartnersOffers.routeName);
                          }),
                    ],
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Provider.of<AppDeterminants>(context, listen: false)
                                  .setUsername('');
                              Provider.of<AppDeterminants>(context, listen: false)
                                  .setToken('');
                              Provider.of<AppDeterminants>(context, listen: false)
                                  .setUserId('');
                              Navigator.pushReplacementNamed(
                                  context, LogInScreen.routeName);
                            },
                            child: Text(S.of(context).logout),
                          ),
                          DropdownButton(
                            value: Provider.of<AppDeterminants>(context).lang,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            onChanged: (value) {
                              Provider.of<AppDeterminants>(context, listen: false)
                                  .setLang(value.toString());
                              S.load(Locale(Provider.of<AppDeterminants>(context,
                                  listen: false)
                                  .lang));
                            },
                            items: <String>['en', 'ar']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
