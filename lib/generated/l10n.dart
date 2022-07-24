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

  /// `fashion store`
  String get fashionStore {
    return Intl.message(
      'fashion store',
      name: 'fashionStore',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
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

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Check login`
  String get inputErrorCheckLogin {
    return Intl.message(
      'Check login',
      name: 'inputErrorCheckLogin',
      desc: '',
      args: [],
    );
  }

  /// `Login must contain more than 3 symbols`
  String get inputErrorLoginIsShort {
    return Intl.message(
      'Login must contain more than 3 symbols',
      name: 'inputErrorLoginIsShort',
      desc: '',
      args: [],
    );
  }

  /// `Check password`
  String get inputErrorCheckPassword {
    return Intl.message(
      'Check password',
      name: 'inputErrorCheckPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain more than 8 symbols`
  String get inputErorPasswordIsShort {
    return Intl.message(
      'Password must contain more than 8 symbols',
      name: 'inputErorPasswordIsShort',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Invalid login or password`
  String get invalidLoginOrPassword {
    return Intl.message(
      'Invalid login or password',
      name: 'invalidLoginOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get shop {
    return Intl.message(
      'Shop',
      name: 'shop',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get russian {
    return Intl.message(
      'Russian',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Sort: `
  String get sort {
    return Intl.message(
      'Sort: ',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `Asc`
  String get asc {
    return Intl.message(
      'Asc',
      name: 'asc',
      desc: '',
      args: [],
    );
  }

  /// `Desc`
  String get desc {
    return Intl.message(
      'Desc',
      name: 'desc',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, check your internet connection`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong, check your internet connection',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Products list is empty...`
  String get productsListIsEmpty {
    return Intl.message(
      'Products list is empty...',
      name: 'productsListIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Not found ID`
  String get withoutID {
    return Intl.message(
      'Not found ID',
      name: 'withoutID',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Category: All`
  String get category {
    return Intl.message(
      'Category: All',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Electronics`
  String get electroincs {
    return Intl.message(
      'Electronics',
      name: 'electroincs',
      desc: '',
      args: [],
    );
  }

  /// `Jewelery`
  String get jewelery {
    return Intl.message(
      'Jewelery',
      name: 'jewelery',
      desc: '',
      args: [],
    );
  }

  /// `Men's clothing`
  String get mensClothing {
    return Intl.message(
      'Men\'s clothing',
      name: 'mensClothing',
      desc: '',
      args: [],
    );
  }

  /// `Women's clothing`
  String get womensClothing {
    return Intl.message(
      'Women\'s clothing',
      name: 'womensClothing',
      desc: '',
      args: [],
    );
  }

  /// `Rating: All`
  String get ratingAll {
    return Intl.message(
      'Rating: All',
      name: 'ratingAll',
      desc: '',
      args: [],
    );
  }

  /// `Rating: 2`
  String get ratingTwo {
    return Intl.message(
      'Rating: 2',
      name: 'ratingTwo',
      desc: '',
      args: [],
    );
  }

  /// `Rating: 3`
  String get ratingThree {
    return Intl.message(
      'Rating: 3',
      name: 'ratingThree',
      desc: '',
      args: [],
    );
  }

  /// `Rating: 4`
  String get ratingFour {
    return Intl.message(
      'Rating: 4',
      name: 'ratingFour',
      desc: '',
      args: [],
    );
  }

  /// `Rating: 5`
  String get ratingFive {
    return Intl.message(
      'Rating: 5',
      name: 'ratingFive',
      desc: '',
      args: [],
    );
  }

  /// `Product details info`
  String get productsDetails {
    return Intl.message(
      'Product details info',
      name: 'productsDetails',
      desc: '',
      args: [],
    );
  }

  /// `Desciption`
  String get description {
    return Intl.message(
      'Desciption',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Not registered yet? Register!`
  String get signUp {
    return Intl.message(
      'Not registered yet? Register!',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get registration {
    return Intl.message(
      'Sign Up',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already registered? Login!`
  String get alreadySignIn {
    return Intl.message(
      'Already registered? Login!',
      name: 'alreadySignIn',
      desc: '',
      args: [],
    );
  }

  /// `The entered passwords do not match. Retype,please`
  String get invalidPassword {
    return Intl.message(
      'The entered passwords do not match. Retype,please',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Welcome,`
  String get welcome {
    return Intl.message(
      'Welcome,',
      name: 'welcome',
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
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
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
