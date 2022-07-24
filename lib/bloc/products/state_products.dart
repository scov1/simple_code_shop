import 'package:simple_code_shop/data/models/products.dart';

abstract class StateBlocProducts {}

class StateProductsInitial extends StateBlocProducts {}

class StateProductsLoading extends StateBlocProducts {}

class StateProductsData extends StateBlocProducts {
  final List<Products> data;

  StateProductsData({required this.data});
}

class StateProductsError extends StateBlocProducts {
  final String error;

  StateProductsError(this.error);
}
