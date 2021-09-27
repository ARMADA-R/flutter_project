import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/AuthController.dart';
import 'package:experienceapp/modules/TicketsController.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/screens/MailingManagerScreen.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../Forms/NewParentManagerTicketFields.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class NewParentManagerTicket extends StatelessWidget {
   NewParentManagerTicket({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'NewParentManagerTicket';
  var form1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ticketTextController = TextEditingController();
  String dropdownValue = S().ChooseTheDepartment;
  String dropdownValue1 = S().ChooseTheType;
  String dropdownValue2 = S().ChooseThePriority;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => NewParentManagerTicketFields(),
        child: Builder(
            builder: (context) {
              form1 = form1 ?? BlocProvider.of<NewParentManagerTicketFields>(context);
              return Theme(data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text(S
                          .of(context)
                          .MailingTheManager),
                      centerTitle: true,
                    ),
                    body: FormBlocListener<NewParentManagerTicketFields,
                        String,
                        String>(
                      onSubmitting: (context, state) async {
                        var dataAsJson = state.toJson();
                      await  TicketController().sentParentToAdminTicket(
                          ticketText: dataAsJson['ticketText'],
                          department: dataAsJson['department'],
                          priority: dataAsJson['prority'],
                          parentId: AppDeterminants().userId,
                          context: context,
                        );
                      },
                      onSuccess: (context, state) {
//                        LoadingDialog.hide(context);

                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MailingManagerScreen(title: 'MailingManagerScreen',)));
                      },

                      child: Container(
                        height: double.infinity,
                        padding: const EdgeInsets.all(24.0),
                        child: SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextFieldBlocBuilder(
                                textFieldBloc: form1.ticketText,
                                decoration: InputDecoration(
                                  labelText: S.of(context).TextMessage,
                                  prefixIcon: Icon(
                                    Icons.text_fields,
                                  ),
                                ),
                              ),
                              DropdownFieldBlocBuilder<String>(
                                selectFieldBloc: form1.department,
                                decoration: InputDecoration(
                                  labelText: S.of(context).ChooseTheDepartment,
                                  prefixIcon: Icon(Icons.sentiment_satisfied),
                                ),
                                itemBuilder: (context, value) => value,
                              ),
                              DropdownFieldBlocBuilder<String>(
                                selectFieldBloc: form1.priority,
                                decoration: InputDecoration(
                                  labelText: S.of(context).ChooseThePriority,
                                  prefixIcon: Icon(Icons.sentiment_satisfied),
                                ),
                                itemBuilder: (context, value) => value,
                              ),
//                              DropdownFieldBlocBuilder<String>(
//                                selectFieldBloc: form1.school,
//                                decoration: InputDecoration(
//                                  labelText: S.of(context).ChooseTheSchool,
//                                  prefixIcon: Icon(Icons.sentiment_satisfied),
//                                ),
//                                itemBuilder: (context, value) => value,
//                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      style: ButtonStyle(
                                          padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.symmetric(vertical: 25),
                                          ),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(20.0),
                                                  side: BorderSide(
                                                      color: Colors.red)))),
                                      onPressed: form1.submit,

                                          //(){print ('fdhd');},
                                      child: Text(S.of(context).Save),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),



                    ),
                  )

              );
            }

        )
    );
  }
}



//  Scaffold(
//  key: _scaffoldKey,
//  drawer: Drawer1(),
//  appBar: AppBar(
//  title: Text(S.of(context).MailingTheManager),
//  centerTitle: true,
//  ),
//  body: LayoutBuilder(
//  builder: (context, constraints) {
//  double width = constraints.maxWidth;
//  double height = constraints.maxHeight;
//  return Center(
//  child: Container(
//  width: width * 0.7,
//  child: Card(
//  color: Colors.white70,
//  child: Form(
//  key: _formKey,
//  child: Column(
//  crossAxisAlignment: CrossAxisAlignment.center,
//  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//  children: [
//  Expanded(
//  child: Padding(
//  padding: EdgeInsets.symmetric(vertical: height * 0.01,
//  horizontal: width * 0.08),
//  child: TextFormField(
//  controller: ticketTextController,
//  decoration: InputDecoration(
//  hintText: S.of(context).TextMessage,
//  ),
//  maxLines: 4,
//  keyboardType: TextInputType.multiline,
//  validator: (String? value) {
//  if (value == null || value.isEmpty) {
//  return S
//      .of(context)
//      .EnterSomeText;
//  }
//  return null;
//  },
//  ),
//  ),
//  ),
//  Expanded(
//  child: Padding(
//  padding: EdgeInsets.symmetric(vertical: height * 0.01,
//  horizontal: width * 0.08),
//  child: Container(
//  width: width * 0.7,
//  child: Column(
//  children: [
//  Text(S.of(context).Department),
//  DropdownButton<String>(
//  value: dropdownValue,
//  style: const TextStyle(color: Colors.black),
//  onChanged: (String? newValue) {
//  setState(() {
//  dropdownValue = newValue!;
//  });
//  },
//  items: <String>[S.of(context).ChooseTheDepartment,
//  S.of(context)
//      .Suggestions,
//  S.of(context)
//      .Queries,
//  S.of(context)
//      .Complaints,
//  ].map<DropdownMenuItem<String>>((
//  String value) {
//  return DropdownMenuItem<String>(
//  value: value,
//  child: Text(value),
//  );
//  }).toList(),
//  ),
//  ],
//  ),
//  ),
//  ),
//  ),
//  Padding(
//  padding: EdgeInsets.symmetric(vertical: height * 0.01,
//  horizontal: width * 0.08),
//  child: Container(
//  width: width * 0.7,
//  child: Column(
//  children: [
//  Text(S
//      .of(context)
//      .Type),
//  DropdownButton<String>(
//  value: dropdownValue1,
//  style: const TextStyle(color: Colors.black),
//  onChanged: (String? newValue) {
//  setState(() {
//  dropdownValue1 = newValue!;
//  });
//  },
//  items: <String>[S
//      .of(context)
//      .ChooseTheType,
////                              S.of(context).Suggestions,
////                              S.of(context).Queries,
////                              S.of(context).Complaints,
//  ].map<DropdownMenuItem<String>>((
//  String value) {
//  return DropdownMenuItem<String>(
//  value: value,
//  child: Text(value),
//  );
//  }).toList(),
//  ),
//  ],
//  ),
//  ),
//  ),
//  Padding(
//  padding: EdgeInsets.symmetric(vertical: height * 0.01,
//  horizontal: width * 0.08),
//  child: Container(
//  width: width * 0.7,
//  child: Column(
//  children: [
//  Text(S
//      .of(context)
//      .priority),
//  DropdownButton<String>(
//  value: dropdownValue2,
//  style: const TextStyle(color: Colors.black),
//  onChanged: (String? newValue) {
//  setState(() {
//  dropdownValue2 = newValue!;
//  });
//  },
//  items: <String>[
//  S
//      .of(context)
//      .ChooseThePriority,
//  S
//      .of(context)
//      .Important,
//  S
//      .of(context)
//      .VeryImportant,
//  ].map<DropdownMenuItem<String>>((
//  String value) {
//  return DropdownMenuItem<String>(
//  value: value,
//  child: Text(value),
//  );
//  }).toList(),
//  ),
//  ],
//  ),
//  ),
//  ),
//
//  Padding(
//  padding: EdgeInsets.symmetric(vertical: height * 0.01,
//  horizontal: width * 0.08),
//  child: ElevatedButton(
//  onPressed: () async {
//  // Validate will return true if the form is valid, or false if
//  // the form is invalid.
//  if (_formKey.currentState!.validate()) {
 // if(await TicketController().sentParentToAdminTicket(
//  ticketText: ticketTextController.text,
//  department: dropdownValue,
//  type: dropdownValue1,
//  priority: dropdownValue2,
//  context: context,
//  parentId: AppDeterminants().userId)) ;                         }
//  },
//  child: Text(S.of(context).Save),
//  ),
//  ),
//
//  ],
//  ),
//  ),
//  ),
//
//  ),
//  );
//  }),
//  );

