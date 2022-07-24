import 'package:flutter/material.dart';
import 'package:simple_code_shop/constants/app_colors.dart';
import 'package:simple_code_shop/constants/app_styles.dart';
import 'package:simple_code_shop/data/models/products.dart';
import 'package:simple_code_shop/generated/l10n.dart';
import 'package:simple_code_shop/navigation/navigataion.dart';
import 'package:simple_code_shop/provider/theme_locale_model.dart';

class ProductCardWidget extends StatelessWidget {
  final Products product;
  const ProductCardWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ThemeLocaleModel();
    return Card(
      color: themeNotifier.isDark
          ? ThemeColor.darkTheme.scaffoldBackgroundColor
          : ThemeColor.lightTheme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: Colors.black.withOpacity(0.10),
        ),
      ),
      elevation: 16,
      shadowColor: Colors.black54,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.main,
          child: product.id == null
              ? Text(S.of(context).withoutID)
              : Text(
                  '${product.id!}',
                  style: AppStyles.s16w600,
                ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            product.title!,
            style: AppStyles.s16w700,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ('${S.of(context).price} \$ ${product.price!}'),
              style: AppStyles.s15w500neutral,
            ),
            Text(
              ('${S.of(context).rating} ${product.rating?.rate}'),
              style: AppStyles.s15w500neutral,
            ),
          ],
        ),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.of(context).pushNamed(
              NavigationRouteNames.productsDetailsScreen,
              arguments: product);
        },
      ),
    );
  }
}
