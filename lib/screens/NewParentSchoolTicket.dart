import 'dart:io';

import 'package:experienceapp/Forms/NewParentSchoolTicketFields.dart';
import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/modules/TicketsController.dart';
import 'package:experienceapp/modules/app_determinants.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class NewParentSchoolTicket extends StatelessWidget {
  static final String routeName = 'NewParentSchoolMessageScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewParentSchoolTicketFields(),
      child: Builder(
        builder: (context) {
          final form = BlocProvider.of<NewParentSchoolTicketFields>(context);
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
                title: Text(S.of(context).MailingTheManager),
                centerTitle: true,
              ),
              body:
                  FormBlocListener<NewParentSchoolTicketFields, String, String>(
                onSubmitting: (context, state) {

                },
                onSuccess: (context, state) {
//                        LoadingDialog.hide(context);

//                        Navigator.of(context).pushReplacement(
//                        MaterialPageRoute(builder: (_) => SuccessScreen()));
                },
                child: SingleChildScrollView(

                  physics: ClampingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
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
                                    style:  ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                                side: BorderSide(color: Colors.red)
                                            )
                                        )
                                    ),
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
