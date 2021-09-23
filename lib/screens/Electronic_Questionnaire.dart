import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:flutter/material.dart';

class ElectronicQuestionnaires extends StatefulWidget {
  const ElectronicQuestionnaires({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'ElectronicQuestionnaires';
  @override
  _ElectronicQuestionnairesState createState() => _ElectronicQuestionnairesState();
}

class _ElectronicQuestionnairesState extends State<ElectronicQuestionnaires> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        child: Column(
          children: [
            DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text('Name',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),

                  DataColumn(
                    label: Text(
                      'Text Message',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),

                  DataColumn(
                    label: Text(
                      'Message Type',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),
                ]),
          ],
        ),
      ),

    );
  }
}
