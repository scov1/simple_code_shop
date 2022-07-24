import 'package:simple_code_shop/data/models/products.dart';
import 'package:simple_code_shop/data/repository/api.dart';
import 'package:simple_code_shop/generated/l10n.dart';

class ProductsRepository {
  final Api api;
  List<Products> filteredList = <Products>[];
  List<Products> _productsList = <Products>[];

  ProductsRepository({required this.api});

  Future<ResultProductsRepository> productsSort(String? sort) async {
    try {
      final result = await api.dio.get(
        '/products',
        queryParameters: {
          "sort": sort,
        },
      );
      _productsList =
          (result.data as List).map((json) => Products.fromJson(json)).toList();
      filteredList = _productsList;
      return ResultProductsRepository(productsList: filteredList);
    } catch (e) {
      return ResultProductsRepository(
          errorMessage: S.current.somethingWentWrong);
    }
  }

  Future<ResultProductsRepository> productsSortbyCategory(
      String? category) async {
    try {
      if (category == "categories") {
        final result = await api.dio.get('/products');
        _productsList = (result.data as List)
            .map((json) => Products.fromJson(json))
            .toList();
        filteredList = _productsList;
        return ResultProductsRepository(productsList: filteredList);
      }
      final result = await api.dio.get('/products/category/$category');
      _productsList =
          (result.data as List).map((json) => Products.fromJson(json)).toList();
      filteredList = _productsList;
      return ResultProductsRepository(productsList: filteredList);
    } catch (e) {
      return ResultProductsRepository(
          errorMessage: S.current.somethingWentWrong);
    }
  }

  ResultProductsRepository productsSortbyRating(double rat) {
    try {
      if (rat == 1) {
        filteredList = _productsList;
      } else {
        List<Products> contain = _productsList
            .where((element) => element.rating!.rate!.truncateToDouble() == rat)
            .toList();
        filteredList = contain;
      }
      return ResultProductsRepository(productsList: filteredList);
    } catch (e) {
      return ResultProductsRepository(
          errorMessage: S.current.somethingWentWrong);
    }
  }
}

class ResultProductsRepository {
  final String? errorMessage;
  final List<Products>? productsList;

  ResultProductsRepository({this.errorMessage, this.productsList});
}
