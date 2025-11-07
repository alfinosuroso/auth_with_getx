import 'package:auth_with_getx/common/app_theme_data.dart';
import 'package:auth_with_getx/common/shared_code.dart';
import 'package:auth_with_getx/page/home_page.dart';
import 'package:auth_with_getx/page/login_page.dart';
import 'package:auth_with_getx/page/register_page.dart';
import 'package:auth_with_getx/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    final token = SharedPreferencesService.getToken();

    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          initialRoute: token != null ? '/home' : '/register',
          getPages: [
            GetPage(name: '/home', page: () => const HomePage()),
            GetPage(name: '/register', page: () => const RegisterPage()),
            GetPage(name: '/login', page: () => const LoginPage()),
          ],
          debugShowCheckedModeBanner: false,
          title: SharedCode.appName,
          theme: AppThemeData.getTheme(context),
        );
      },
    );
  }
}
