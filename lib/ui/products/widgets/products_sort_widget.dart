import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_code_shop/bloc/products/bloc_products.dart';
import 'package:simple_code_shop/bloc/products/event_products.dart';
import 'package:simple_code_shop/generated/l10n.dart';

class ProductsSortWidget extends StatefulWidget {
  const ProductsSortWidget({Key? key}) : super(key: key);

  @override
  State<ProductsSortWidget> createState() => _ProductsSortWidgetState();
}

class _ProductsSortWidgetState extends State<ProductsSortWidget> {
  String selectedValue = 'asc';
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: 'asc',
        child: Text(S.of(context).asc),
      ),
      DropdownMenuItem(
        value: 'desc',
        child: Text(
          S.of(context).desc,
        ),
      )
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            '${S.of(context).sort}:',
            style: const TextStyle(fontSize: 16),
          ),
        ),
        DropdownButton<String>(
            value: selectedValue,
            onChanged: (String? newValue) {
              selectedValue = newValue!;
              BlocProvider.of<BlocProducts>(context).add(
                EventProductSort(selectedValue),
              );
              setState(() {});
            },
            items: dropdownItems),
      ],
    );
  }
}
