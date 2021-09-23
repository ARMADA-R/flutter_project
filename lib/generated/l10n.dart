// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `SMS`
  String get appTitle {
    return Intl.message(
      'SMS',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Al-Mobarmejon for manage schools`
  String get homeScreenTitle {
    return Intl.message(
      'Al-Mobarmejon for manage schools',
      name: 'homeScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Public Messages Forms`
  String get PublicMessagesForms {
    return Intl.message(
      'Public Messages Forms',
      name: 'PublicMessagesForms',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password and confirm password don't match!`
  String get passAndRePAssDontMatch {
    return Intl.message(
      'Password and confirm password don\'t match!',
      name: 'passAndRePAssDontMatch',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Learning type`
  String get learningType {
    return Intl.message(
      'Learning type',
      name: 'learningType',
      desc: '',
      args: [],
    );
  }

  /// `General education`
  String get generalEducation {
    return Intl.message(
      'General education',
      name: 'generalEducation',
      desc: '',
      args: [],
    );
  }

  /// `Memorization`
  String get memorization {
    return Intl.message(
      'Memorization',
      name: 'memorization',
      desc: '',
      args: [],
    );
  }

  /// `Materials`
  String get materials {
    return Intl.message(
      'Materials',
      name: 'materials',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `School Name`
  String get schoolName {
    return Intl.message(
      'School Name',
      name: 'schoolName',
      desc: '',
      args: [],
    );
  }

  /// `Ministerial number`
  String get ministerialNumber {
    return Intl.message(
      'Ministerial number',
      name: 'ministerialNumber',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message(
      'Area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `re-enter password`
  String get rePassword {
    return Intl.message(
      're-enter password',
      name: 'rePassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Do you have account?`
  String get doYouHaveAccount {
    return Intl.message(
      'Do you have account?',
      name: 'doYouHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get ForgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'ForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your Profile`
  String get Profile {
    return Intl.message(
      'Your Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get Done {
    return Intl.message(
      'Done',
      name: 'Done',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get Welcome {
    return Intl.message(
      'Welcome',
      name: 'Welcome',
      desc: '',
      args: [],
    );
  }

  /// `Number Of Notifications`
  String get NumberOfNotifications {
    return Intl.message(
      'Number Of Notifications',
      name: 'NumberOfNotifications',
      desc: '',
      args: [],
    );
  }

  /// `The Sender's Name`
  String get TheSendersName {
    return Intl.message(
      'The Sender\'s Name',
      name: 'TheSendersName',
      desc: '',
      args: [],
    );
  }

  /// `Add a Form`
  String get AddaForm {
    return Intl.message(
      'Add a Form',
      name: 'AddaForm',
      desc: '',
      args: [],
    );
  }

  /// `Form's Name`
  String get FormsName {
    return Intl.message(
      'Form\'s Name',
      name: 'FormsName',
      desc: '',
      args: [],
    );
  }

  /// `Text Message`
  String get Text {
    return Intl.message(
      'Text Message',
      name: 'Text',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get EnterYourEmail {
    return Intl.message(
      'Enter Your Email',
      name: 'EnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Some Text`
  String get EnterSomeText {
    return Intl.message(
      'Enter Some Text',
      name: 'EnterSomeText',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get ResetPassword {
    return Intl.message(
      'Reset Password',
      name: 'ResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `The Address`
  String get TheAddress {
    return Intl.message(
      'The Address',
      name: 'TheAddress',
      desc: '',
      args: [],
    );
  }

  /// `Type Of Sending`
  String get TypeOfSending {
    return Intl.message(
      'Type Of Sending',
      name: 'TypeOfSending',
      desc: '',
      args: [],
    );
  }

  /// `Content`
  String get Content {
    return Intl.message(
      'Content',
      name: 'Content',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp`
  String get WhatsApp {
    return Intl.message(
      'WhatsApp',
      name: 'WhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `Text Message`
  String get TextMessage {
    return Intl.message(
      'Text Message',
      name: 'TextMessage',
      desc: '',
      args: [],
    );
  }

  /// `Exams Table`
  String get ExamsTable {
    return Intl.message(
      'Exams Table',
      name: 'ExamsTable',
      desc: '',
      args: [],
    );
  }

  /// `School Management`
  String get SchoolManagement {
    return Intl.message(
      'School Management',
      name: 'SchoolManagement',
      desc: '',
      args: [],
    );
  }

  /// `General Table`
  String get GeneralTable {
    return Intl.message(
      'General Table',
      name: 'GeneralTable',
      desc: '',
      args: [],
    );
  }

  /// `Electronic Questionnaires`
  String get ElectronicQuestionnaires {
    return Intl.message(
      'Electronic Questionnaires',
      name: 'ElectronicQuestionnaires',
      desc: '',
      args: [],
    );
  }

  /// `Electronic Forms`
  String get ElectronicForms {
    return Intl.message(
      'Electronic Forms',
      name: 'ElectronicForms',
      desc: '',
      args: [],
    );
  }

  /// `School Alerts`
  String get SchoolAlerts {
    return Intl.message(
      'School Alerts',
      name: 'SchoolAlerts',
      desc: '',
      args: [],
    );
  }

  /// `Technical Support`
  String get TechnicalSupport {
    return Intl.message(
      'Technical Support',
      name: 'TechnicalSupport',
      desc: '',
      args: [],
    );
  }

  /// `Mailing The Manager`
  String get MailingTheManager {
    return Intl.message(
      'Mailing The Manager',
      name: 'MailingTheManager',
      desc: '',
      args: [],
    );
  }

  /// `Mailing The Management`
  String get MailingTheManagement {
    return Intl.message(
      'Mailing The Management',
      name: 'MailingTheManagement',
      desc: '',
      args: [],
    );
  }

  /// `Department`
  String get Department {
    return Intl.message(
      'Department',
      name: 'Department',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get priority {
    return Intl.message(
      'Priority',
      name: 'priority',
      desc: '',
      args: [],
    );
  }

  /// `suggestions`
  String get Suggestions {
    return Intl.message(
      'suggestions',
      name: 'Suggestions',
      desc: '',
      args: [],
    );
  }

  /// `Queries`
  String get Queries {
    return Intl.message(
      'Queries',
      name: 'Queries',
      desc: '',
      args: [],
    );
  }

  /// `Complaints`
  String get Complaints {
    return Intl.message(
      'Complaints',
      name: 'Complaints',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get Type {
    return Intl.message(
      'Type',
      name: 'Type',
      desc: '',
      args: [],
    );
  }

  /// `Important`
  String get Important {
    return Intl.message(
      'Important',
      name: 'Important',
      desc: '',
      args: [],
    );
  }

  /// `VeryImportant`
  String get VeryImportant {
    return Intl.message(
      'VeryImportant',
      name: 'VeryImportant',
      desc: '',
      args: [],
    );
  }

  /// `Choose The Type`
  String get ChooseTheType {
    return Intl.message(
      'Choose The Type',
      name: 'ChooseTheType',
      desc: '',
      args: [],
    );
  }

  /// `ChooseThePriority`
  String get ChooseThePriority {
    return Intl.message(
      'ChooseThePriority',
      name: 'ChooseThePriority',
      desc: '',
      args: [],
    );
  }

  /// `Choose The Department`
  String get ChooseTheDepartment {
    return Intl.message(
      'Choose The Department',
      name: 'ChooseTheDepartment',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
