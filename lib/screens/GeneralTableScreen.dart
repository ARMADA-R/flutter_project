import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:experienceapp/widgets/PagesBackground.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:url_launcher/url_launcher.dart';

class GeneralTableScreen extends StatefulWidget {
  const GeneralTableScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'GeneralTableScreen';
  @override
  _GeneralTableScreenState createState() => _GeneralTableScreenState();
}

class _GeneralTableScreenState extends State<GeneralTableScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List generalTable = [];

  @override
  initState(
      ) {
    // TODO: implement initState
    super.initState();
      Future.delayed(Duration.zero,() async{
        var url = Uri.parse("https://rafi.nobalaa.com/CodeSchoolSystem/Schools/GetParentSchoolTable?school_id=${AppDeterminants().schoolsIds}&page=1&limit=10000");
        var response = await http.get(url, headers: {
          "authorization":AppDeterminants().token,
        });
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        generalTable=jsonResponse['data'];
        print (response.body);
        setState(() {});
      } );
  }

  Widget generalTableListile(String title, String subtitle, String semester, String date ,String link ){
    return ListTile(
      title: Text(title),
      subtitle:Text(subtitle),
      trailing: Column(children: [
        Text("الفصل : $semester"),
        Text(date),
      ],),
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
        title: Text(S.of(context).GeneralTable),
        backgroundColor: Colors.blue[300],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PagesBackground(),
          Center(
            child:ListView.separated(
                itemBuilder:  (BuildContext context, int index) {
                  print(index);
                  return generalTableListile(
                    generalTable.elementAt(index)["class_name"],
                    generalTable.elementAt(index)["school_name"],
                    generalTable.elementAt(index)["semester"],
                    generalTable.elementAt(index)["date"],
                    generalTable.elementAt(index)["file_path"],
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemCount: generalTable.length),
          ),
        ],
      ),
    );
  }
}
