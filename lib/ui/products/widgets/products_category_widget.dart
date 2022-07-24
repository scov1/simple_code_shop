import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_code_shop/bloc/products/bloc_products.dart';
import 'package:simple_code_shop/bloc/products/event_products.dart';
import 'package:simple_code_shop/generated/l10n.dart';

class ProductsCategoryWidget extends StatefulWidget {
  const ProductsCategoryWidget({Key? key}) : super(key: key);

  @override
  State<ProductsCategoryWidget> createState() => _ProductsCategoryWidgetState();
}

class _ProductsCategoryWidgetState extends State<ProductsCategoryWidget> {
  String selectedValue = 'categories';
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: "categories",
        child: Text(S.of(context).category),
      ),
      DropdownMenuItem(
        value: "electronics",
        child: Text(
          S.of(context).electroincs,
        ),
      ),
      DropdownMenuItem(
        value: "jewelery",
        child: Text(
          S.of(context).jewelery,
        ),
      ),
      DropdownMenuItem(
        value: "men's clothing",
        child: Text(
          S.of(context).mensClothing,
        ),
      ),
      DropdownMenuItem(
        value: "women's clothing",
        child: Text(
          S.of(context).womensClothing,
        ),
      ),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: DropdownButton(
          value: selectedValue,
          onChanged: (String? newValue) {
            selectedValue = newValue!;
            BlocProvider.of<BlocProducts>(context).add(
              EventProductSortByCategory(selectedValue),
            );
            setState(() {});
          },
          items: dropdownItems),
    );
  }
}
