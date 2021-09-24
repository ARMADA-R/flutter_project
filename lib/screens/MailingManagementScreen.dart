import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MailingManagementScreen extends StatefulWidget {
  const MailingManagementScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'MailingManagementScreen';
  @override
  _MailingManagementScreenState createState() => _MailingManagementScreenState();
}

class _MailingManagementScreenState extends State<MailingManagementScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  List mailingManagementTable = [];
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero,() async{
      var url = Uri.parse("https://rafi.nobalaa.com/CodeSchoolSystem/Tickets/GetParentsSchoolsTickets?parent_id=${AppDeterminants().userId}&page=1&limit=10000&status=&date=&school_name=");
      var response = await http.get(url, headers: {
        "authorization":AppDeterminants().token,
      });
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      mailingManagementTable=jsonResponse['data'];
      print (response.body);
      setState(() {});
    } );
  }
  Widget mailingManagementTableListile(String title, String id ){
    return ListTile(
      title: Text(title),
//      onTap: () async {
//        var urllaunchable = await canLaunch(id); //canLaunch is from url_launcher package
//        if(urllaunchable){
//          await launch(link); //launch is from url_launcher package to launch URL
//        } else {
//          print("URL can't be launched.");
//        }
//      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed:(){} ,),
      key: _scaffoldKey,
      drawer: Drawer1(),
      appBar: AppBar(
        title: Text(S.of(context).MailingTheManagement),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              print(index);
              return mailingManagementTableListile(
                mailingManagementTable.elementAt(index)["school_name"],
                mailingManagementTable.elementAt(index)["school_id"],
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemCount: mailingManagementTable.length
        ),
      ),

    );
  }
}
