import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simple_code_shop/constants/app_styles.dart';
import 'package:simple_code_shop/data/repository/settings_repository.dart';
import 'package:simple_code_shop/generated/l10n.dart';
import 'package:simple_code_shop/provider/theme_locale_model.dart';
import 'package:simple_code_shop/ui/widgets/bottom_nav_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<DropdownMenuItem<String>> get dropdownItemsLocale {
    List<DropdownMenuItem<String>> menuItemsLocale = [
      DropdownMenuItem(
        value: "ru_RU",
        child: Text(S.of(context).russian),
      ),
      DropdownMenuItem(
        value: "en",
        child: Text(
          S.of(context).english,
        ),
      )
    ];
    return menuItemsLocale;
  }

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<ThemeLocaleModel>(context);
    return Consumer(
      builder: (context, ThemeLocaleModel themeLocaleModel, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              S.of(context).settings,
              style: AppStyles.s20w500main,
            ),
            elevation: 0.0,
            actions: [
              IconButton(
                  onPressed: () {
                    themeLocaleModel.isDark
                        ? themeLocaleModel.isDark = false
                        : themeLocaleModel.isDark = true;
                  },
                  icon: Icon(themeLocaleModel.isDark
                      ? Icons.wb_sunny
                      : Icons.nightlight_round)),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      '${S.of(context).language}:',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  DropdownButton(
                      value: Intl.getCurrentLocale(),
                      onChanged: (String? newValue) async {
                        if (newValue == null) return;
                        locale.changeLocale(newValue);
                        context.read<SettingsRepository>().saveLocale(newValue);
                      },
                      items: dropdownItemsLocale),
                ],
              ),
            ],
          ),
          bottomNavigationBar: const BottomNavBar(selectedTab: 1),
        );
      },
    );
  }
}
