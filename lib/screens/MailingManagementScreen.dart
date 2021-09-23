import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:flutter/material.dart';

class MailingManagementScreen extends StatefulWidget {
  const MailingManagementScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'MailingManagementScreen';
  @override
  _MailingManagementScreenState createState() => _MailingManagementScreenState();
}

class _MailingManagementScreenState extends State<MailingManagementScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
