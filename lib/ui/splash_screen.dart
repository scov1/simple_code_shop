import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simple_code_shop/constants/app_assets.dart';
import 'package:simple_code_shop/constants/app_colors.dart';
import 'package:simple_code_shop/data/repository/settings_repository.dart';
import 'package:simple_code_shop/generated/l10n.dart';
import 'package:simple_code_shop/navigation/navigataion.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.main,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    super.dispose();
  }

  @override
  void initState() {
    final settingsRepository = context.read<SettingsRepository>();
    settingsRepository.init().whenComplete(
      () async {
        var defaultLocale = const Locale('ru', 'RU');
        final auth = await settingsRepository.checkAuth() ?? false;
        final locale = await settingsRepository.readLocale();
        if (locale == 'en') {
          defaultLocale = const Locale('en');
        }
        S.load(defaultLocale).whenComplete(
          () {
            Future.delayed(
              const Duration(seconds: 2),
            ).whenComplete(
              () {
                Navigator.of(context).pushReplacementNamed(auth
                    ? NavigationRouteNames.productsScreen
                    : NavigationRouteNames.loginScreen);
              },
            );
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(AppAssets.images.backround),
          ),
        ],
      ),
    );
  }
}
