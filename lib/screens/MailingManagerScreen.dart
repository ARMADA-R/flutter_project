import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/screens/NewMessage.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:flutter/material.dart';

class MailingManagerScreen extends StatefulWidget {
  const MailingManagerScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'MailingManagerScreen';
  @override
  _MailingManagerScreenState createState() => _MailingManagerScreenState();
}

class _MailingManagerScreenState extends State<MailingManagerScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed:(){} ,),

      key: _scaffoldKey,
      drawer: Drawer1(),
      appBar: AppBar(
       actions: [
         FloatingActionButton(child: Icon(Icons.add),onPressed:(){
           Navigator.pushNamed(context, NewMessageScreen.routeName);
         } ,),
       ],
        title: Text(S.of(context).MailingTheManager),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(S.of(context).TextMessage,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),

                  DataColumn(
                    label: Text(
                      S.of(context).Department,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),

                  DataColumn(
                    label: Text(
                      S.of(context).TypeOfSending,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      S.of(context).priority,
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
