import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:experienceapp/Forms/NewParentSchoolTicketFields.dart';
import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/TicketsController.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NewParentSchoolTicket extends StatefulWidget {
  static final String routeName = 'NewParentSchoolMessageScreen';
  @override
  _NewParentSchoolTicketState createState() => _NewParentSchoolTicketState();
}
class _NewParentSchoolTicketState extends State<NewParentSchoolTicket> {
  var form;
  Map schoolPare = {};
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      var url = Uri.parse(
          'https://rafi.nobalaa.com/CodeSchoolSystem/schools/GetSchoolsParent?schools_id=${AppDeterminants().schoolsIds}&parent_id=${AppDeterminants().userId}');
      var response = await http
          .get(url, headers: {"authorization": AppDeterminants().token});
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      List data = jsonResponse['data'];
      List<String> schools = [];
      data.forEach((element) {
        schools.add(element["school_name"] as String);
        schoolPare[element["school_name"]] = element["school_id"];
      });

      if (form != null) {
        form.school.updateItems(schools);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewParentSchoolTicketFields(),
      child: Builder(
        builder: (context) {
          form = form ?? BlocProvider.of<NewParentSchoolTicketFields>(context);
          return Theme(
            data: Theme.of(context).copyWith(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Scaffold(
              appBar: AppBar(
                title: Text(S.of(context).MailingTheManagement),
                centerTitle: true,
              ),
              body:
                  FormBlocListener<NewParentSchoolTicketFields, String, String>(
                onSubmitting: (context, state) {
                  var dataAsJson = state.toJson();
                  print(schoolPare[dataAsJson['school']]);
                  print(schoolPare);
                  TicketController().sentParentToSchoolTicket(
                      ticketText: dataAsJson['message'],
                      department: dataAsJson['department'],
                      type: "-",
                      priority: dataAsJson['priority'],
                      parentId: AppDeterminants().userId,
                      schoolId: schoolPare[dataAsJson['school']]?? '',
                      context: context,
                  );
                },
                onSuccess: (context, state) {
//                        LoadingDialog.hide(context);

//                        Navigator.of(context).pushReplacement(
//                        MaterialPageRoute(builder: (_) => SuccessScreen()));
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
                          textFieldBloc: form.message,
                          decoration: InputDecoration(
                            labelText: S.of(context).TextMessage,
                            prefixIcon: Icon(
                              Icons.text_fields,
                            ),
                          ),
                        ),
                        DropdownFieldBlocBuilder<String>(
                          selectFieldBloc: form.department,
                          decoration: InputDecoration(
                            labelText: S.of(context).ChooseTheDepartment,
                            prefixIcon: Icon(Icons.sentiment_satisfied),
                          ),
                          itemBuilder: (context, value) => value,
                        ),
                        DropdownFieldBlocBuilder<String>(
                          selectFieldBloc: form.priority,
                          decoration: InputDecoration(
                            labelText: S.of(context).ChooseThePriority,
                            prefixIcon: Icon(Icons.sentiment_satisfied),
                          ),
                          itemBuilder: (context, value) => value,
                        ),
                        DropdownFieldBlocBuilder<String>(
                          selectFieldBloc: form.school,
                          decoration: InputDecoration(
                            labelText: S.of(context).ChooseTheSchool,
                            prefixIcon: Icon(Icons.sentiment_satisfied),
                          ),
                          itemBuilder: (context, value) => value,
                        ),
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
                                onPressed: form.submit,
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
            ),
          );
        },
      ),
    );
  }
}
