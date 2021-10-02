import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegistrationFields extends FormBloc<String, String> {
  final email = TextFieldBloc(
    name: "email",
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email
    ],
  );

  final username = TextFieldBloc(
    name: "username",
    validators: [
      FieldBlocValidators.required
    ],
  );

  final city = TextFieldBloc(
    name: "city",
    validators: [
      FieldBlocValidators.required
    ],
  );

  final area = TextFieldBloc(
    name: "area",
    validators: [
      FieldBlocValidators.required
    ],
  );

  var rePassword = TextFieldBloc(
    name: "rePassword",
    validators: [
      FieldBlocValidators.required,
    ],
  );
  final password = TextFieldBloc(
    name: "password",
    validators: [
      FieldBlocValidators.required,
    ],
  );


  final phone = TextFieldBloc(
    name: "phone",
    validators: [
      FieldBlocValidators.required
    ],
  );





  Validator<String> _confirmPassword(
      TextFieldBloc passwordTextFieldBloc,
      ) {
    return (String? confirmPassword) {
      if (confirmPassword == passwordTextFieldBloc.value) {
        return null;
      }
      return 'Must be equal to password';
    };
  }


  RegistrationFields() {
    addFieldBlocs(fieldBlocs: [
      city,
      area,
      phone,
      username,
      email,
      password,
      rePassword,
    ]);

    rePassword
      ..addValidators([_confirmPassword(password)])
      ..subscribeToFieldBlocs([password]);
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
