import 'package:experienceapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'dart:io';

class NewParentManagerTicketFields extends FormBloc<String, String> {


  final ticketText = TextFieldBloc(
      name: "ticket_text",
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final department = SelectFieldBloc(
    name: 'department',
    items: [
      S().Suggestions,
      S().Queries,
      S().Complaints,
    ],
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final priority = SelectFieldBloc(
    name: "priority",
    items: [
      S().Important,
      S().VeryImportant,
    ],
    validators: [
      FieldBlocValidators.required,
    ],
  );

  NewParentManagerTicketFields() {
    addFieldBlocs(fieldBlocs: [
      ticketText,
      department,
      priority,
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
