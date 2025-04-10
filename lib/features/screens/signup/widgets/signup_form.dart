import 'package:deal_nest/features/authentication/controllers/signup/signup_controller.dart';
import 'package:deal_nest/features/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:deal_nest/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class MySignupForm extends StatelessWidget {
  const MySignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              /// First Name & Last Name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.firstName,
                      labelStyle: TextStyle(fontSize: 13),
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.lastName,
                      labelStyle: TextStyle(fontSize: 13),
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          ///Username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                TValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: InputDecoration(
                labelText: TTexts.username,
                labelStyle: TextStyle(fontSize: 13),
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          ///Email
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: controller.email,
            decoration: InputDecoration(
                labelText: TTexts.email,
                labelStyle: TextStyle(fontSize: 13),
                prefixIcon: Icon(Iconsax.direct)),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          ///Phone Number
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: InputDecoration(
                labelText: TTexts.phoneNo,
                labelStyle: TextStyle(fontSize: 13),
                prefixIcon: Icon(Iconsax.call)),
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
                  labelStyle: TextStyle(fontSize: 13),
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  )),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),

          ///Terms & Conditions checkbox
          MyTermsAndConditionCheckbox(),
          SizedBox(height: TSizes.spaceBtwSections),

          ///Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
