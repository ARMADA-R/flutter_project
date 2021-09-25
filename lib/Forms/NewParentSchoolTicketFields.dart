
import 'package:experienceapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'dart:io';

class NewParentSchoolTicketFields extends FormBloc<String, String> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ticketTextController = TextEditingController();
  String dropdownValue = S().ChooseTheDepartment;
  String dropdownValue1 = S().ChooseTheType;
  String dropdownValue2 = S().ChooseThePriority;

  final message = TextFieldBloc();

  final department = SelectFieldBloc(
    items: [
      S().Suggestions,
      S().Queries,
      S().Complaints,
    ],
  );

  final priority = SelectFieldBloc(
    items: [
      S().ChooseThePriority,
      S().Important,
      S().VeryImportant,
    ],
  );

  var school = SelectFieldBloc(
    items: [
      "0",
    ],
  );

  NewParentSchoolTicketFields() {;

//  super(isLoading: false);
    addFieldBlocs(fieldBlocs: [
      message,
      department,
      priority,
      school,
    ])
  }

  @override
  void onLoading() {
    print("onLoading");
  }


  @override
  void onSubmitting() async {
    try {
      await Future<void>.delayed(Duration(milliseconds: 500));

      emitSuccess(canSubmitAgain: true);
    } catch (e) {
      emitFailure();
    }
  }
}
