import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/TicketsController.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/screens/MailingManagerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../Forms/NewParentManagerTicketFields.dart';
class NewParentManagerTicket extends StatelessWidget {
   NewParentManagerTicket({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'NewParentManagerTicket';
  var form1;

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
                      onSubmitting: (context, state)  {
                        var dataAsJson = state.toJson();
                      TicketController().sentParentToAdminTicket(
                          ticketText: dataAsJson['ticket_text'],
                          department: dataAsJson['department'],
                          priority: dataAsJson['priority'],
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

