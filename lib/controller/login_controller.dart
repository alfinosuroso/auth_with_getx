import 'package:auth_with_getx/repositories/auth_repositories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var showPassword = false.obs;
  var isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    try {
      final res = await AuthRepositories().login(
        nameController.text,
        passwordController.text,
      );
      if (res == true) {
        // snackbar success
        Get.snackbar('Masuk!', 'Login Berhasil');
        Get.offAllNamed('/home');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
