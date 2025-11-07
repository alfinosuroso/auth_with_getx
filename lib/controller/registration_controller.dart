import 'package:auth_with_getx/repositories/auth_repositories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var showPassword = false.obs;
  var isLoading = false.obs;

  Future<void> register() async {
    isLoading.value = true;
    try {
      final res = await AuthRepositories().register(
        nameController.text,
        emailController.text,
        passwordController.text,
      );
      if (res == true) {
        // snackbar success
        Get.snackbar('Daftar!', 'Daftar Berhasil');
        Get.offAllNamed('/login');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
