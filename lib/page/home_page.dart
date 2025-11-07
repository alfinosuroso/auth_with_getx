import 'package:auth_with_getx/common/app_colors.dart';
import 'package:auth_with_getx/common/dimens.dart';
import 'package:auth_with_getx/model/auth_model.dart';
import 'package:auth_with_getx/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthModel? authModel = SharedPreferencesService.getAuthModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: _buildBody(),
    );
  }

  Center _buildBody() {
    return Center(
      child: Container(
        margin: Dimens.marginDefault,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang ${authModel?.username}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Dimens.verticalSpaceLarge,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red600,
              ),
              onPressed: () {
                SharedPreferencesService.clearAllPrefs();
                Get.offAllNamed('/login');
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
