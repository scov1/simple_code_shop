import 'package:flutter/material.dart';
import 'package:simple_code_shop/data/models/products.dart';
import 'package:simple_code_shop/provider/auth_model.dart';
import 'package:simple_code_shop/ui/auth/login_screen.dart';
import 'package:simple_code_shop/ui/auth/registration_screen.dart';
import 'package:simple_code_shop/ui/products/products_details_screen.dart';
import 'package:simple_code_shop/ui/products/products_screen.dart';
import 'package:simple_code_shop/ui/splash_screen.dart';

class NavigationRouteNames {
  static const splashScreen = '/';
  static const loginScreen = '/auth';
  static const registrationScreen = '/sign_up';
  static const productsScreen = '/products_screen';
  static const productsDetailsScreen = '/products_screen/products_details';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    NavigationRouteNames.splashScreen: (context) => const SplashScreen(),
    NavigationRouteNames.loginScreen: (context) => AuthProvider(
          model: AuthModel(),
          child: const LoginScreen(),
        ),
    NavigationRouteNames.registrationScreen: (context) => AuthProvider(
          model: AuthModel(),
          child: const RegistrationScreen(),
        ),
    NavigationRouteNames.productsScreen: (context) => const ProductScreen(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    if (settings.name == NavigationRouteNames.productsDetailsScreen) {
      final args = settings.arguments as Products;
      return MaterialPageRoute(
        builder: (context) => ProductsDetailsWidget(product: args),
      );
    }

    const widget = Text('Navigation error!');
    return MaterialPageRoute(builder: (context) => widget);
  }
}
