import 'package:deal_nest/common/styles/spacing_styles.dart';
import 'package:deal_nest/features/screens/login/widgets/login_form.dart';
import 'package:deal_nest/features/screens/login/widgets/login_header.dart';
import 'package:deal_nest/utils/constants/colors.dart';
import 'package:deal_nest/utils/constants/image_strings.dart';
import 'package:deal_nest/utils/constants/sizes.dart';
import 'package:deal_nest/utils/constants/text_strings.dart';
import 'package:deal_nest/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/login_signup/form_divider.dart';
import '../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Logo, title & subtitle
              MyLoginHeader(),

              ///Form
              MyLoginForm(),

              ///Divider
              MyFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Footer
              MySocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
