
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginFields extends FormBloc<String, String> {
  final email = TextFieldBloc(
      name: "email",
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email
    ],
  );
  final password = TextFieldBloc(
      name: "password",
    validators: [
      FieldBlocValidators.required,
    ],
  );

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
