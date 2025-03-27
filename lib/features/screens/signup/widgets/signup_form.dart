import 'package:deal_nest/features/screens/signup/verify_email.dart';
import 'package:deal_nest/features/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class MySignupForm extends StatelessWidget {
  const MySignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
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
            expands: false,
            decoration: InputDecoration(
                labelText: TTexts.username,
                labelStyle: TextStyle(fontSize: 13),
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          ///Email
          TextFormField(
            decoration: InputDecoration(
                labelText: TTexts.email,
                labelStyle: TextStyle(fontSize: 13),
                prefixIcon: Icon(Iconsax.direct)),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          ///Phone Number
          TextFormField(
            decoration: InputDecoration(
                labelText: TTexts.phoneNo,
                labelStyle: TextStyle(fontSize: 13),
                prefixIcon: Icon(Iconsax.call)),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          ///Password
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: TTexts.password,
              labelStyle: TextStyle(fontSize: 13),
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
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
              onPressed: () => Get.to(() => VerifyEmailScreen()),
              child: Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
