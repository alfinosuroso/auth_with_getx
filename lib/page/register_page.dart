import 'package:auth_with_getx/common/app_colors.dart';
import 'package:auth_with_getx/common/dimens.dart';
import 'package:auth_with_getx/common/shared_code.dart';
import 'package:auth_with_getx/components/custom_text_field.dart';
import 'package:auth_with_getx/controller/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegistrationController _registrationController = Get.put(
    RegistrationController(),
  );

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
                  "Registrasi",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Dimens.verticalSpaceMedium,
              CustomTextFormField(
                title: null,
                hintText: "Masukkan username",
                controller: _registrationController.nameController,
                prefix: const Icon(Icons.person),
                // validator: SharedCode(context).emptyValidator,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                title: null,
                hintText: "Masukkan alamat email",
                controller: _registrationController.emailController,
                prefix: const Icon(Icons.email_outlined),
                validator: SharedCode(context).emailValidator,
                keyboardType: TextInputType.emailAddress,
              ),
              Obx(
                () => CustomTextFormField(
                  title: null,
                  hintText: "Masukkan password",
                  obsecure: !_registrationController.showPassword.value,
                  controller: _registrationController.passwordController,
                  prefix: const Icon(Icons.lock_outline),
                  suffix: IconButton(
                    onPressed: () {
                      _registrationController.showPassword.value =
                          !_registrationController.showPassword.value;
                    },
                    icon: Icon(
                      _registrationController.showPassword.value
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
                    _registrationController.isLoading.value
                        ? null
                        : _registrationController.register();
                  },
                  child: _registrationController.isLoading.value
                      ? CircularProgressIndicator()
                      : Text("Daftar"),
                ),
              ),

              Dimens.verticalSpaceMedium,
              Row(
                children: <Widget>[
                  Expanded(child: Divider()),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text(
                      "Sudah memiliki akun?",
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
                  Get.offAllNamed('/login');
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
