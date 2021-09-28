import 'package:experienceapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'dart:io';

class NewParentSchoolTicketFields extends FormBloc<String, String> {


  final message = TextFieldBloc(
    name: "message"
  );

  final department = SelectFieldBloc(
    name: 'department',
    items: [
      S().Suggestions,
      S().Queries,
      S().Complaints,
    ],
  );

  final priority = SelectFieldBloc(
    name: "priority",
    items: [
      S().ChooseThePriority,
      S().Important,
      S().VeryImportant,
    ],
  );

  var school = SelectFieldBloc(
    name: "school",
    items: [

    ],
  );

  NewParentSchoolTicketFields() {

//  super(isLoading: false);
    addFieldBlocs(fieldBlocs: [
      message,
      department,
      priority,
      school,
    ]);
  }

//  @override
//  void onLoading() {
//    print("onLoading");
//  }


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
