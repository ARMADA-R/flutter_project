import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/AuthController.dart';
import 'package:experienceapp/modules/TicketsController.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:flutter/material.dart';


class NewMessageScreen extends StatefulWidget {
  const NewMessageScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'NewMessageScreen';
  @override
  _NewMessageScreenState createState() => _NewMessageScreenState();
}

class _NewMessageScreenState extends State<NewMessageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ticketTextController = TextEditingController();
  String dropdownValue = S().ChooseTheDepartment;
  String dropdownValue1 = S().ChooseTheType;
  String dropdownValue2 = S().ChooseThePriority;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer1(),
      appBar: AppBar(
        title: Text(S.of(context).MailingTheManager),
        centerTitle: true,
      ),
      body: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            double height = constraints.maxHeight;
            return Center(
              child: Container(
                width: width * 0.7,
                child: Card(
                  color: Colors.white70,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: height * 0.01,
                                horizontal: width * 0.08),
                            child: TextFormField(
                              controller: ticketTextController,
                              decoration: InputDecoration(
                                hintText: S.of(context).TextMessage,
                              ),
                              maxLines: 4,
                              keyboardType: TextInputType.multiline,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return S
                                      .of(context)
                                      .EnterSomeText;
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: height * 0.01,
                                horizontal: width * 0.08),
                            child: Container(
                              width: width * 0.7,
                              child: Column(
                                children: [
                                  Text(S.of(context).Department),
                                  DropdownButton<String>(
                                    value: dropdownValue,
                                    style: const TextStyle(color: Colors.black),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: <String>[S.of(context).ChooseTheDepartment,
                                      S.of(context)
                                          .Suggestions,
                                      S.of(context)
                                          .Queries,
                                      S.of(context)
                                          .Complaints,
                                    ].map<DropdownMenuItem<String>>((
                                        String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: height * 0.01,
                              horizontal: width * 0.08),
                          child: Container(
                            width: width * 0.7,
                            child: Column(
                              children: [
                                Text(S
                                    .of(context)
                                    .Type),
                                DropdownButton<String>(
                                  value: dropdownValue1,
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue1 = newValue!;
                                    });
                                  },
                                  items: <String>[S
                                      .of(context)
                                      .ChooseTheType,
//                              S.of(context).Suggestions,
//                              S.of(context).Queries,
//                              S.of(context).Complaints,
                                  ].map<DropdownMenuItem<String>>((
                                      String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: height * 0.01,
                              horizontal: width * 0.08),
                          child: Container(
                            width: width * 0.7,
                            child: Column(
                              children: [
                                Text(S
                                    .of(context)
                                    .priority),
                                DropdownButton<String>(
                                  value: dropdownValue2,
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue2 = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    S
                                        .of(context)
                                        .ChooseThePriority,
                                    S
                                        .of(context)
                                        .Important,
                                    S
                                        .of(context)
                                        .VeryImportant,
                                  ].map<DropdownMenuItem<String>>((
                                      String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: height * 0.01,
                              horizontal: width * 0.08),
                          child: ElevatedButton(
                            onPressed: () async {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState!.validate()) {
                                if(await TicketController().sentParentToAdminTicket(
                                    ticketText: ticketTextController.text,
                                    department: dropdownValue,
                                    type: dropdownValue1,
                                    priority: dropdownValue2,
                                    context: context,
                                    parentId: AppDeterminants().userId)) ;                         }
                              },
                            child: Text(S.of(context).Save),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ),
            );
          }),
    );
  }
}
