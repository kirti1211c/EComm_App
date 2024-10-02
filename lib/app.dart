import 'package:ecomm/bindings/general_bindings.dart';
import 'package:ecomm/routes/app_routes.dart';
import 'package:ecomm/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:ecomm/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecomm App',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator (color: Colors.white))),
    );
  }
}