import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_code_shop/bloc/products/bloc_products.dart';
import 'package:simple_code_shop/bloc/products/event_products.dart';
import 'package:simple_code_shop/generated/l10n.dart';

class ProductsRatingWidget extends StatefulWidget {
  const ProductsRatingWidget({Key? key}) : super(key: key);

  @override
  State<ProductsRatingWidget> createState() => _ProductsRatingWidgetState();
}

class _ProductsRatingWidgetState extends State<ProductsRatingWidget> {
  double selectedValue = 1.0;
  List<DropdownMenuItem<double>> get dropdownItems {
    List<DropdownMenuItem<double>> menuItems = [
      DropdownMenuItem(
        value: 1.0,
        child: Text(S.of(context).ratingAll),
      ),
      DropdownMenuItem(
        value: 2.0,
        child: Text(
          S.of(context).ratingTwo,
        ),
      ),
      DropdownMenuItem(
        value: 3.0,
        child: Text(
          S.of(context).ratingThree,
        ),
      ),
      DropdownMenuItem(
        value: 4.0,
        child: Text(
          S.of(context).ratingFour,
        ),
      ),
      DropdownMenuItem(
        value: 5.0,
        child: Text(
          S.of(context).ratingFive,
        ),
      ),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DropdownButton(
              value: selectedValue,
              onChanged: (double? newValue) {
                selectedValue = newValue!;
                BlocProvider.of<BlocProducts>(context).add(
                  EventProductSortByRating(selectedValue),
                );
                setState(() {});
              },
              items: dropdownItems),
        ],
      ),
    );
  }
}
