import 'package:flutter/material.dart';
import 'package:simple_code_shop/data/repository/api.dart';
import 'package:simple_code_shop/data/repository/settings_repository.dart';

class AuthModel extends ChangeNotifier {
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final settingsRepository = SettingsRepository();

  Future<void> auth(BuildContext context) async {
    var response = await Api().dio.post(
          "/auth/login",
          data: ({"username": "mor_2314", "password": "83r5^_"}),
        );

    if (response.statusCode == 200) {
      settingsRepository.saveAuth();
      notifyListeners();
    } else {
      return;
    }
    notifyListeners();
  }
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;
  const AuthProvider({Key? key, required this.model, required Widget child})
      : super(key: key, notifier: model, child: child);

  static AuthProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

  static AuthProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
    return widget is AuthProvider ? widget : null;
  }
}
