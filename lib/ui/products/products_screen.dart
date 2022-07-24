import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:simple_code_shop/bloc/products/bloc_products.dart';
import 'package:simple_code_shop/bloc/products/state_products.dart';
import 'package:simple_code_shop/constants/app_colors.dart';
import 'package:simple_code_shop/constants/app_styles.dart';
import 'package:simple_code_shop/data/repository/settings_repository.dart';
import 'package:simple_code_shop/generated/l10n.dart';
import 'package:simple_code_shop/navigation/navigataion.dart';
import 'package:simple_code_shop/ui/products/widgets/products_list_widget.dart';
import 'package:simple_code_shop/ui/products/widgets/products_category_widget.dart';
import 'package:simple_code_shop/ui/products/widgets/products_rating_widget.dart';
import 'package:simple_code_shop/ui/products/widgets/products_sort_widget.dart';
import 'package:simple_code_shop/ui/widgets/bottom_nav_bar.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final settingsRepository =
        Provider.of<SettingsRepository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).shop),
        actions: [
          IconButton(
              onPressed: () {
                settingsRepository.logoutAuth();
                Navigator.of(context)
                    .pushReplacementNamed(NavigationRouteNames.loginScreen);
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const ProductsSortWidget(),
          const Divider(
            color: AppColors.main,
            thickness: 0.3,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [ProductsCategoryWidget(), ProductsRatingWidget()],
          ),
          const Divider(
            color: AppColors.main,
            thickness: 0.3,
          ),
          const SizedBox(height: 15),
          BlocBuilder<BlocProducts, StateBlocProducts>(
            builder: (context, state) {
              if (state is StateProductsLoading) {
                return Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              }
              if (state is StateProductsError) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          state.error,
                          style: AppStyles.s15w500neutral,
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (state is StateProductsData) {
                return state.data.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(S.of(context).productsListIsEmpty),
                        ],
                      )
                    : ProductsListWidget(
                        products: state.data,
                      );
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedTab: 0),
    );
  }
}
