import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_code_shop/bloc/products/bloc_products.dart';
import 'package:simple_code_shop/bloc/products/event_products.dart';
import 'package:simple_code_shop/data/repository/api.dart';
import 'package:simple_code_shop/data/repository/products_repository.dart';
import 'package:simple_code_shop/data/repository/settings_repository.dart';

class InitWidget extends StatelessWidget {
  final Widget child;
  const InitWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Api(),
        ),
        RepositoryProvider(
          create: (context) => SettingsRepository(),
        ),
        RepositoryProvider(
          create: (context) => ProductsRepository(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BlocProducts(
              productsRepository:
                  RepositoryProvider.of<ProductsRepository>(context),
            )..add(
                EventProductSort('asc'),
              ),
          )
        ],
        child: child,
      ),
    );
  }
}
