import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/screens/NewParentManagerTicket.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MailingManagerScreen extends StatefulWidget {
  const MailingManagerScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'MailingManagerScreen';
  @override
  _MailingManagerScreenState createState() => _MailingManagerScreenState();
}

class _MailingManagerScreenState extends State<MailingManagerScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List mailingManagerTable = [];
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero,() async{
      var url = Uri.parse("https://rafi.nobalaa.com/CodeSchoolSystem/Tickets/GetParent"
          "AdminTicketsById?parent_id=${AppDeterminants().userId}&page=1&limit=8000&status=");
      var response = await http.get(url, headers: {
        "authorization":AppDeterminants().token,
      });
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      mailingManagerTable=jsonResponse['data'];
      print (response.body);
      setState(() {});
    } );
  }
  Widget mailingManagerTableListile(String title, String? lastReply, String? date,String id ){
    return ListTile(
      title: Text(title),
      subtitle: Text(lastReply == null?"":lastReply),
      trailing:Text(date == null?"":date),
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
    //  floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed:(){} ,),

      key: _scaffoldKey,
      drawer: Drawer1(),
      appBar: AppBar(
       actions: [
         FloatingActionButton(child: Icon(Icons.add),onPressed:(){
           Navigator.pushNamed(context, NewParentManagerTicket.routeName);
         } ,),
       ],
        title: Text(S.of(context).MailingTheManager),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              print(index);
              return mailingManagerTableListile(
                mailingManagerTable.elementAt(index)["ticket_text"],
                mailingManagerTable.elementAt(index)["reply"],
                mailingManagerTable.elementAt(index)["date"],
                mailingManagerTable.elementAt(index)["id"],
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemCount: mailingManagerTable.length
        ),
      ),

    );
  }
}
