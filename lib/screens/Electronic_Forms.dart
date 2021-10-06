import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:experienceapp/widgets/PagesBackground.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ElectronicForms extends StatefulWidget {
  const ElectronicForms({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'ElectronicForms';
  @override
  _ElectronicFormsState createState() => _ElectronicFormsState();
}

class _ElectronicFormsState extends State<ElectronicForms> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List electronicFormsTable = [];
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero,() async{
      var url = Uri.parse("https://rafi.nobalaa.com/CodeSchoolSystem/Servies/GetForms?school_id=${AppDeterminants().schoolsIds}&page=1&limit=7000");
      var response = await http.get(url, headers: {
        "authorization":AppDeterminants().token,
      });
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      electronicFormsTable=jsonResponse['data'];
      print (response.body);
      setState(() {});
    } );
  }
  Widget electronicFormsTableListile(String title,String link ){
    return ListTile(
      title: Text(title),
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
        title: Text(S.of(context).ElectronicForms),
        backgroundColor: Colors.blue[300],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PagesBackground(),
          Center(
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  print(index);
                  return electronicFormsTableListile(
                    electronicFormsTable.elementAt(index)["title"],
                    electronicFormsTable.elementAt(index)["link"],
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemCount: electronicFormsTable.length
            ),
          ),
        ],
      ),

    );
  }
}
