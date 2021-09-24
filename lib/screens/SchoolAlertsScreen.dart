import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:flutter/material.dart';

class SchoolAlertsScreen extends StatefulWidget {
  const SchoolAlertsScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'SchoolAlertsScreen';
  @override
  SchoolAlertsScreenState createState() => SchoolAlertsScreenState();
}

class SchoolAlertsScreenState extends State<SchoolAlertsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  _buildListTile( String title, String subTitle, DateTime date) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text(subTitle),
      trailing: Text(date.toString()),
    );
  }
  List alerts =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer1(),
      appBar: AppBar(
        title: Text(S.of(context).SchoolAlerts),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            itemBuilder: (context,index)=> _buildListTile( alerts[index], 'subTitle', DateTime.now()),
        itemCount: alerts.length,
        ),
      )

          );
  }
}
