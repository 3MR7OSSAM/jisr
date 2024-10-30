import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jisr/core/configs/assets/app_images.dart';
import 'package:jisr/core/configs/theme/app_colors.dart';
import 'package:jisr/presentation/auth/widgets/auth_top_widget.dart';
import 'package:jisr/presentation/auth/widgets/remember_me.dart';
import 'package:jisr/presentation/auth/widgets/terms_widgets.dart';
import '../../../core/common/widgets/custom_button.dart';
import '../../../core/configs/routing/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             AuthTopWidget(
              title: 'Create your\nAccount',
              subtitle: 'Already have an account?',
              buttonTitle: 'Log in',
              onTap: (){
                GoRouter.of(context).go(Routes.loginRoute);
              },
            ),
            SizedBox(
              height: 0.67.sh,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    _emailField(context),
                    const SizedBox(height: 20),
                    _passwordField(context),
                    const SizedBox(height: 20),
                    _confirmPasswordField(context),
                    const SizedBox(height: 10),
                    const RememberMe(),
                    const SizedBox(height: 20),
                    Center(
                      child: CustomButton(
                        onTap: () {
                          // Handle registration logic
                        },
                        bgColor: AppColors.darkGrey,
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(thickness: 1),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('Or sign up with'),
                        ),
                        Expanded(
                          child: Divider(thickness: 1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: CustomButton(
                        onTap: () {
                          // Handle Google sign-up logic
                        },
                        bgColor: AppColors.whiteColor.withOpacity(0.9),
                        child: Image.asset(
                          AppImages.googleLogo,
                          width: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TermsWidgets(),
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
      child: TextField(
        controller: _password,
        decoration: const InputDecoration(
          hintText: 'Password',
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
        obscureText: true,
      ),
    );
  }

  Widget _confirmPasswordField(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: _confirmPassword,
        decoration: const InputDecoration(
          hintText: 'Confirm Password',
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
        obscureText: true,
      ),
    );
  }
}
