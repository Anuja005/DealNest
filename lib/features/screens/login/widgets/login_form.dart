import 'package:deal_nest/features/authentication/controllers/login/login_controller.dart';
import 'package:deal_nest/features/screens/password_configuration/forgot_password.dart';
import 'package:deal_nest/features/screens/signup/signup.dart';
import 'package:deal_nest/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class MyLoginForm extends StatelessWidget {
  const MyLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            ///Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),

            ///Password
            Obx(
              () => TextFormField(
                validator: (value) => TValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields / 2),

            ///Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    Text(TTexts.rememberMe),
                  ],
                ),

                ///Forgot Password
                TextButton(
                    onPressed: () => Get.to(() => ForgotPassword()),
                    child: Text(TTexts.forgetPassword)),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            ///Sign in Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: Text(TTexts.signIn))),
            SizedBox(height: TSizes.spaceBtwItems),

            ///Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => SignupScreen()),
                    child: Text(TTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
