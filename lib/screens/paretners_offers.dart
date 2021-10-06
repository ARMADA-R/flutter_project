import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:experienceapp/widgets/PagesBackground.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PartnersOffers extends StatefulWidget {
  const PartnersOffers({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'PartnersOffers';
  @override
  _PartnersOffersState createState() => _PartnersOffersState();
}

class _PartnersOffersState extends State<PartnersOffers> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List partnersOffersTable = [];
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero,() async{
      var url = Uri.parse("https://rafi.nobalaa.com/CodeSchoolSystem/Partners/GetPartners?page=1&limit=2000&user_id=${AppDeterminants().userId}");
      var response = await http.get(url, headers: {
        "authorization":AppDeterminants().token,
      });
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      partnersOffersTable=jsonResponse['data'];
      print (response.body);
      setState(() {});
    } );
  }
  Widget partnersOffersTableListile(String title,String city,String area, String date,String price, String discount, String link ){
    return ListTile(
      title: Text(title),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$city : $area"),
          Text(date),
        ],
      ),
      trailing:Column(

        children: [
          Text(price),
          Text(discount),
        ],

      ) ,
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
        backgroundColor: Colors.blue[300],
        title: Text(S.of(context).PartnersOffers),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PagesBackground(),
          Center(
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  print(index);
                  return partnersOffersTableListile(
                    partnersOffersTable.elementAt(index)["service_name"],
                    partnersOffersTable.elementAt(index)["city"],
                    partnersOffersTable.elementAt(index)["area"],
                    partnersOffersTable.elementAt(index)["end_date"],
                    partnersOffersTable.elementAt(index)["service_price"],
                    partnersOffersTable.elementAt(index)["discount"],
                    partnersOffersTable.elementAt(index)["image_url"],
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemCount: partnersOffersTable.length
            ),
          ),
        ],
      ),

    );
  }
}
