import 'package:experienceapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'dart:io';

class LoginFields extends FormBloc<String, String> {
  final email = TextFieldBloc(name: "email");
  final password = TextFieldBloc(name: "password");

  LoginFields() {
    addFieldBlocs(fieldBlocs: [
      email,
      password,
    ]);
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
