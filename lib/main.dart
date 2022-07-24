import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:simple_code_shop/generated/l10n.dart';
import 'package:simple_code_shop/navigation/navigataion.dart';
import 'package:simple_code_shop/provider/theme_locale_model.dart';
import 'package:simple_code_shop/ui/widgets/init_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final mainNavigation = MainNavigation();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: ChangeNotifierProvider<ThemeLocaleModel>(
        create: (_) => ThemeLocaleModel(),
        child: Consumer(
          builder: (context, ThemeLocaleModel themeNotifier, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeNotifier.isDark
                  ? ThemeColor.darkTheme
                  : ThemeColor.lightTheme,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              routes: mainNavigation.routes,
              initialRoute: NavigationRouteNames.splashScreen,
              onGenerateRoute: mainNavigation.onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
