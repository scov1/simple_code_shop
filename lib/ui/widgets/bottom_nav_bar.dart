import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_code_shop/constants/app_assets.dart';
import 'package:simple_code_shop/constants/app_colors.dart';
import 'package:simple_code_shop/constants/app_styles.dart';
import 'package:simple_code_shop/generated/l10n.dart';
import 'package:simple_code_shop/ui/products/products_screen.dart';
import 'package:simple_code_shop/ui/settings_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedTab;
  const BottomNavBar({Key? key, required this.selectedTab}) : super(key: key);

  PageRouteBuilder _createRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedTab,
      selectedItemColor: AppColors.mainExtra,
      unselectedItemColor: Colors.white60,
      selectedLabelStyle: AppStyles.s14w900,
      unselectedLabelStyle: AppStyles.s14w900,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.svg.clothesIcon,
                color: selectedTab == 0 ? AppColors.mainExtra : Colors.white,
                height: 25,
                width: 24,
                fit: BoxFit.scaleDown),
            label: S.of(context).shop),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SvgPicture.asset(
              AppAssets.svg.settingsIcon,
              color: selectedTab == 1 ? AppColors.mainExtra : Colors.white,
            ),
          ),
          label: S.of(context).settings,
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.of(context).pushAndRemoveUntil(
            _createRoute(
              const ProductScreen(),
            ),
            (route) => false,
          );
        } else if (index == 1) {
          Navigator.of(context).pushAndRemoveUntil(
            _createRoute(
              const SettingsScreen(),
            ),
            (route) => false,
          );
        }
      },
    );
  }
}
