import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_code_shop/constants/app_assets.dart';
import 'package:simple_code_shop/constants/app_colors.dart';
import 'package:simple_code_shop/constants/app_styles.dart';
import 'package:simple_code_shop/data/repository/settings_repository.dart';
import 'package:simple_code_shop/generated/l10n.dart';
import 'package:simple_code_shop/navigation/navigataion.dart';
import 'package:simple_code_shop/ui/auth/widgets/bottom_wave_clipper_widget.dart';
import 'package:simple_code_shop/ui/auth/widgets/confirm_password_text_form_field_widget.dart';
import 'package:simple_code_shop/ui/auth/widgets/login_text_form_field_widget.dart';
import 'package:simple_code_shop/ui/auth/widgets/password_text_form_field_widget.dart';
import 'package:simple_code_shop/provider/auth_model.dart';
import 'widgets/modal_error_registration_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? login;
  String? password;
  String? confirmPass;

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.of(context)?.model;
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    Expanded(child: Image.asset(AppAssets.images.logo)),
                    const SizedBox(height: 20),
                    Text(
                      S.of(context).fashionStore.toUpperCase(),
                      style: AppStyles.s30w900,
                    ),
                    const SizedBox(height: 50),
                    LoginTextFormFieldWidget(
                      icon: const Icon(Icons.email),
                      hint: S.of(context).login,
                      isVisible: false,
                      onSaved: (value) {
                        login = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    PasswordTextFormFieldWidget(
                      icon: const Icon(Icons.lock),
                      hint: S.of(context).password,
                      isVisible: true,
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    ConfirmPasswordTextFormFieldWidget(
                      icon: const Icon(Icons.lock),
                      hint: S.of(context).confirmPassword,
                      isVisible: true,
                      onSaved: (value) {
                        confirmPass = value;
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: SizedBox(
                    width: 319,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          _formKey.currentState?.save();
                          if (password == confirmPass) {
                            model?.auth(context);
                            Navigator.of(context).pushReplacementNamed(NavigationRouteNames.productsScreen);
                            context.read<SettingsRepository>().saveAuth();
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  const ModalErrorRegistrationWidget(),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.mainExtra,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        S.of(context).registration,
                        style: AppStyles.s16w500main,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(NavigationRouteNames.loginScreen);
            },
            child: Text(
              S.of(context).alreadySignIn,
              style: AppStyles.s14w400neutral,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: BottomWaveClipperWidget(),
              child: Container(
                color: Colors.white,
                height: 180,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
