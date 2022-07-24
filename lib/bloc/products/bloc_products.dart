import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_code_shop/bloc/products/event_products.dart';
import 'package:simple_code_shop/bloc/products/state_products.dart';
import 'package:simple_code_shop/data/repository/products_repository.dart';

class BlocProducts extends Bloc<EventBlocProduct, StateBlocProducts> {
  final ProductsRepository productsRepository;

  BlocProducts({required this.productsRepository})
      : super(StateProductsInitial()) {
    on<EventProductSort>(
      (event, emit) async {
        emit(
          StateProductsLoading(),
        );
        final result = await productsRepository.productsSort(event.sort);
        if (result.errorMessage != null) {
          emit(StateProductsError(result.errorMessage!));
          return;
        }
        emit(
          StateProductsData(data: result.productsList!),
        );
      },
    );
    on<EventProductSortByCategory>(
      (event, emit) async {
        emit(
          StateProductsLoading(),
        );
        final result =
            await productsRepository.productsSortbyCategory(event.category);
        if (result.errorMessage != null) {
          emit(
            StateProductsError(result.errorMessage!),
          );
          return;
        }
        emit(
          StateProductsData(data: result.productsList!),
        );
      },
    );
    on<EventProductSortByRating>(
      (event, emit) {
        emit(
          StateProductsLoading(),
        );
        final result = productsRepository.productsSortbyRating(event.rating);
        if (result.errorMessage != null) {
          emit(
            StateProductsError(result.errorMessage!),
          );
          return;
        }
        emit(
          StateProductsData(data: result.productsList!),
        );
      },
    );
  }
}
