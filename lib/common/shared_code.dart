import 'package:auth_with_getx/common/app_colors.dart';
import 'package:flutter/material.dart';

class SharedCode {
  final BuildContext context;

  SharedCode(this.context);

  static const appName = 'Auth with GetX';

  // Production (live)
  static const String baseUrl = "https://dummyjson.com";

  static const String authJson = 'auth-json';

  static final formKey1 = GlobalKey<FormState>();
  static final formKey2 = GlobalKey<FormState>();
  static final formKey3 = GlobalKey<FormState>();

  String? emailValidator(value) {
    bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);
    return !emailValid ? "Email tidak valid" : null;
  }

  // password validator
  String? passwordValidator(value) {
    return value.toString().trim().isEmpty || value == null
        ? "Password wajib diisi"
        : null;
  }

  // I want to make link validator that must at least there https://drive.google.com
  String? linkValidator(value) {
    return value.toString().trim().isEmpty || value == null
        ? "Link wajib diisi"
        : !value.toString().startsWith("https://")
        ? "Link tidak valid (contoh: https://..)"
        : null;
  }

  String? emptyValidator(value) {
    return value.toString().trim().isEmpty || value == null
        ? "Data tidak boleh kosong"
        : null;
  }

  static void successSnackBar({
    required BuildContext context,
    required String text,
  }) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
      ),
      backgroundColor: AppColors.success,
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void errorSnackBar({
    required BuildContext context,
    required String text,
  }) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
      ),
      backgroundColor: AppColors.dangerous,
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void infoSnackBar({
    required BuildContext context,
    required String text,
  }) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
      ),
      backgroundColor: AppColors.darkGrey,
      duration: const Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
