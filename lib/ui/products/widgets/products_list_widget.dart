import 'package:flutter/material.dart';
import 'package:simple_code_shop/data/models/products.dart';
import 'package:simple_code_shop/ui/products/widgets/product_card_widget.dart';

class ProductsListWidget extends StatelessWidget {
  final List<Products> products;
  const ProductsListWidget({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCardWidget(product: product);
          },
          separatorBuilder: (_, index) => const SizedBox.shrink(),
          itemCount: products.length),
    );
  }
}
