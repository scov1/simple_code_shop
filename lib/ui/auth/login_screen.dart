import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_code_shop/constants/app_assets.dart';
import 'package:simple_code_shop/constants/app_colors.dart';
import 'package:simple_code_shop/constants/app_styles.dart';
import 'package:simple_code_shop/data/repository/settings_repository.dart';
import 'package:simple_code_shop/generated/l10n.dart';
import 'package:simple_code_shop/navigation/navigataion.dart';
import 'package:simple_code_shop/ui/auth/widgets/bottom_wave_clipper_widget.dart';
import 'package:simple_code_shop/ui/auth/widgets/login_text_form_field_widget.dart';
import 'package:simple_code_shop/ui/auth/widgets/modal_error_widget.dart';
import 'package:simple_code_shop/ui/auth/widgets/password_text_form_field_widget.dart';
import 'package:simple_code_shop/provider/auth_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey =  GlobalKey<FormState>();
  String? login;
  String? password;

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
                      icon: const Icon(Icons.account_circle),
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
                          if (login == 'qwerty' && password == '123456ab') {
                            model?.auth(context);
                            Navigator.of(context).pushReplacementNamed(NavigationRouteNames.productsScreen);
                            context.read<SettingsRepository>().saveAuth();
                          }
                           else {
                            showDialog(
                              context: context,
                              builder: (context) => const ModalErrorWidget(),
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
                        S.of(context).signIn,
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
              Navigator.of(context).pushReplacementNamed(NavigationRouteNames.registrationScreen);
            },
            child: Text(
              S.of(context).signUp,
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
