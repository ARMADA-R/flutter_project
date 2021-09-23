import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:flutter/material.dart';

class ElectronicForms extends StatefulWidget {
  const ElectronicForms({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'ElectronicForms';
  @override
  _ElectronicFormsState createState() => _ElectronicFormsState();
}

class _ElectronicFormsState extends State<ElectronicForms> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer1(),
      appBar: AppBar(
        title: Text(S.of(context).ElectronicForms),
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
