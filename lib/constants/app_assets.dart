abstract class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();

  final String backround = 'assets/images/bitmap/splash_back.png';
  final String logo = 'assets/images/bitmap/logo.png';
}

class _Svg {
  const _Svg();

  final String clothesIcon = 'assets/images/svg/clothes_icon.svg';
  final String settingsIcon = 'assets/images/svg/settings_icon.svg';
  final String priceIcon = 'assets/images/svg/price_icon.svg';
}
