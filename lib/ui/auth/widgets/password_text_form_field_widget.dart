import 'package:flutter/material.dart';
import 'package:simple_code_shop/generated/l10n.dart';
import 'package:simple_code_shop/provider/auth_model.dart';

class PasswordTextFormFieldWidget extends StatelessWidget {
  final Icon icon;
  final String hint;
  final bool isVisible;
  final Function(String?) onSaved;
  const PasswordTextFormFieldWidget(
      {Key? key,
      required this.icon,
      required this.hint,
      required this.isVisible,
      required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.read(context)?.model;
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: model?.passwordTextController,
        style: const TextStyle(fontSize: 20, color: Colors.white),
        obscureText: isVisible,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).inputErrorCheckPassword;
          }
          if (value.length < 8) {
            return S.of(context).inputErorPasswordIsShort;
          }
          return null;
        },
        decoration: InputDecoration(
          hintStyle: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white30),
          hintText: hint,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3,
            ),
          ),
          focusedErrorBorder:  const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          errorStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white54,
              width: 1,
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: IconTheme(
              data: const IconThemeData(color: Colors.white),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
