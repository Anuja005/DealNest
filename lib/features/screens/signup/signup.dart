import 'package:deal_nest/common/widgets/appbar/appbar.dart';
import 'package:deal_nest/common/widgets/login_signup/form_divider.dart';
import 'package:deal_nest/common/widgets/login_signup/social_buttons.dart';
import 'package:deal_nest/features/screens/signup/widgets/signup_form.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:deal_nest/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              MySignupForm(),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Divider
              MyFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Social Buttons
              MySocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
