import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:url_launcher/url_launcher.dart';

class ElectronicQuestionnaires extends StatefulWidget {
  const ElectronicQuestionnaires({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'ElectronicQuestionnaires';
  @override
  _ElectronicQuestionnairesState createState() => _ElectronicQuestionnairesState();
}

class _ElectronicQuestionnairesState extends State<ElectronicQuestionnaires> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List electronicQuestionnairesTable = [];
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero,() async{
      var url = Uri.parse("https://rafi.nobalaa.com/CodeSchoolSystem/Servies/GetParentSurvey?school_id=${AppDeterminants().schoolsIds}&page=1&limit=10000");
      var response = await http.get(url, headers: {
        "authorization":AppDeterminants().token,
      });
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      electronicQuestionnairesTable=jsonResponse['data'];
      print (response.body);
      setState(() {});
    } );
  }
  Widget electronicQuestionnairesListile(String title, String date ,String link ){
    return ListTile(
      title: Text(title),
      trailing: Text(date),
      onTap: () async {
        var urllaunchable = await canLaunch(link); //canLaunch is from url_launcher package
        if(urllaunchable){
          await launch(link); //launch is from url_launcher package to launch URL
        } else {
          print("URL can't be launched.");
        }
      },

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer1(),
      appBar: AppBar(
        title: Text(S.of(context).ElectronicQuestionnaires),
        centerTitle: true,
      ),
      body: Center(
        child:ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              print(index);
              return electronicQuestionnairesListile(
              electronicQuestionnairesTable.elementAt(index)["title"],
              electronicQuestionnairesTable.elementAt(index)["date"],
              electronicQuestionnairesTable.elementAt(index)["short_link"],
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemCount: electronicQuestionnairesTable.length),
      ),

    );
  }
}
