import 'package:auth_with_getx/common/app_colors.dart';
import 'package:auth_with_getx/common/dimens.dart';
import 'package:auth_with_getx/common/shared_code.dart';
import 'package:auth_with_getx/components/custom_text_field.dart';
import 'package:auth_with_getx/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  GestureDetector _buildBody(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Padding(
        padding: Dimens.paddingAllDefault,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Dimens.verticalSpaceMedium,
              CustomTextFormField(
                title: null,
                hintText: "Masukkan username",
                controller: _loginController.nameController,
                prefix: const Icon(Icons.person),
                // validator: SharedCode(context).emptyValidator,
                keyboardType: TextInputType.emailAddress,
              ),
              Obx(
                () => CustomTextFormField(
                  title: null,
                  hintText: "Masukkan password",
                  obsecure: !_loginController.showPassword.value,
                  controller: _loginController.passwordController,
                  prefix: const Icon(Icons.lock_outline),
                  suffix: IconButton(
                    onPressed: () {
                      _loginController.showPassword.value =
                          !_loginController.showPassword.value;
                    },
                    icon: Icon(
                      _loginController.showPassword.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                  validator: SharedCode(context).passwordValidator,
                ),
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: () async {
                    _loginController.isLoading.value
                        ? null
                        : _loginController.login();
                  },
                  child: _loginController.isLoading.value
                      ? CircularProgressIndicator()
                      : Text("Login"),
                ),
              ),

              Dimens.verticalSpaceMedium,
              Row(
                children: <Widget>[
                  Expanded(child: Divider()),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text(
                      "Belum memiliki akun?",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textInput,
                      ),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              Dimens.verticalSpaceMedium,
              OutlinedButton(
                onPressed: () {
                  Get.offAllNamed('/register');
                },
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
