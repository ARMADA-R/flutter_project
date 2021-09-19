import 'package:experienceapp/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:data_tables/data_tables.dart';

class PublicMessagesForms extends StatefulWidget {
  const PublicMessagesForms({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'PublicMessagesForms';

  @override
  _PublicMessagesFormsState createState() => _PublicMessagesFormsState();
}

class _PublicMessagesFormsState extends State<PublicMessagesForms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).PublicMessagesForms),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        return SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: height * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Card(
                          child: Column(
                            children: [
                              Text(
                                S.of(context).NumberOfNotifications,
                                style: TextStyle(fontSize: 27),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: Column(
                            children: [
                              Text(
                                S.of(context).TheSendersName,
                                style: TextStyle(fontSize: 27),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Card(
                        child: ElevatedButton(
                          child: Text(S.of(context).AddaForm),
                          onPressed: () {},
                        ),
                      ),
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
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
