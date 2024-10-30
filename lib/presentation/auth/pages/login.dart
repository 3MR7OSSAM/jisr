import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jisr/core/common/widgets/basic_eclipse.dart';
import 'package:jisr/core/configs/assets/app_images.dart';
import 'package:jisr/core/configs/routing/routes.dart';
import 'package:jisr/core/configs/theme/app_colors.dart';
import 'package:jisr/presentation/auth/widgets/auth_top_widget.dart';
import 'package:jisr/presentation/auth/widgets/remember_me.dart';
import 'package:jisr/presentation/auth/widgets/terms_widgets.dart';

import '../../../core/common/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             AuthTopWidget(title: 'Sign in to your\nAccount',subtitle: 'Don’t have an account?',buttonTitle: 'Sign up',onTap: (){
              GoRouter.of(context).go(Routes.registerRoute);
            },),
            SizedBox(
              height: 0.6.sh,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    _emailField(context),
                    const SizedBox(height: 20),
                    _passwordField(context),
                    const SizedBox(height: 10),
                    const RememberMe(),
                    const SizedBox(height: 20),
                    Center(
                      child: CustomButton(
                        onTap: () {
                          GoRouter.of(context).go(Routes.pagesController);
                        },
                        bgColor: AppColors.darkGrey,
                        child: const Text('Log In',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(
                            child: Divider(
                              // color: AppColors.whiteColor,
                              thickness: 1,
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('Or login with',
                             ),
                        ),
                        Expanded(
                            child: Divider(
                              // color: AppColors.whiteColor,
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: CustomButton(
                        onTap: () {

                        },
                        bgColor: AppColors.whiteColor.withOpacity(0.9),
                        child: Image.asset(
                          AppImages.googleLogo,
                          width: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TermsWidgets()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return SizedBox(
      // height: 70,
      child: TextField(
        controller: _email,
        decoration: const InputDecoration(
          hintText: 'Email',
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return SizedBox(
      // height: 70,
      child: TextField(
        controller: _password,
        decoration: const InputDecoration(
          hintText: 'Password',
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }
}

