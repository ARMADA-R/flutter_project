import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:url_launcher/url_launcher.dart';


class SchoolExamsTable extends StatefulWidget {
  const SchoolExamsTable({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'SchoolExamsTable';
  @override
  _SchoolExamsTableState createState() => _SchoolExamsTableState();
}

class _SchoolExamsTableState extends State<SchoolExamsTable> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List examsTables = [];

  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      var url =
      Uri.parse('https://rafi.nobalaa.com/CodeSchoolSystem/Schools/GetParentExamTable?school_id=${AppDeterminants().schoolsIds}&page=1&limit=1000');
      var response = await http.get(url, headers: {
        "authorization" : AppDeterminants().token
      });

      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      examsTables = jsonResponse['data'];
      print(jsonResponse['data']);
     // print(response.body);
      setState(() {});
    });
  }

  Widget _examTableListile(String title, String subtitle, String trailing, String link){
 // print(0);
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(trailing),
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
        title: Text(S.of(context).ExamsTable),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              print(index);
              return _examTableListile(
                examsTables.elementAt(index)["class_name"],
                examsTables.elementAt(index)["school_name"],
                examsTables.elementAt(index)["semester"],
                examsTables.elementAt(index)["file_path"],
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemCount: examsTables.length
        )
      ),

    );
  }
}
