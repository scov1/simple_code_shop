import 'package:flutter/material.dart';
import 'package:simple_code_shop/constants/app_styles.dart';
import 'package:simple_code_shop/data/models/products.dart';
import 'package:simple_code_shop/generated/l10n.dart';
import 'package:simple_code_shop/ui/widgets/bottom_nav_bar.dart';

class ProductsDetailsWidget extends StatelessWidget {
  final Products product;
  const ProductsDetailsWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).productsDetails),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 290,
                child: Image.network(
                  product.image!,
                  fit: BoxFit.fitHeight,
                )),
            const SizedBox(height: 25),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '${product.title}',
                    style: AppStyles.s20w500main,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.attach_money,
                                size: 45,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('${product.price}')
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.star_border,
                                size: 45,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('${product.rating?.rate}')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.black12,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        S.of(context).description,
                        style: AppStyles.s16w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        '${product.description}',
                        style: AppStyles.s16w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        selectedTab: 0,
      ),
    );
  }
}
