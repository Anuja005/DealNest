import 'package:deal_nest/binding/general_binding.dart';
import 'package:deal_nest/routes/app_routes.dart';
import 'package:deal_nest/utils/constants/colors.dart';
import 'package:deal_nest/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: Scaffold(
          backgroundColor: TColors.primary,
          body: Center(child: CircularProgressIndicator(color: TColors.white))),
    );
  }
}
