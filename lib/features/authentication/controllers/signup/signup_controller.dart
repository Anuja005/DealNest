import 'package:deal_nest/utils/helpers/network_manager.dart';
import 'package:deal_nest/utils/popups/full_screen_loader.dart';
import 'package:deal_nest/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables

  final hidePassword = true.obs; //observable for hide and show password
  final privacyPolicy = true.obs; //observable for privacy policy accept
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation
  ///Sign up

  Future<void> signup() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      //form validation
      if (!signupFormKey.currentState!.validate()) return;

      //privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }
      //register user in the firebase authentication & save user
      //save authenticated user data in Firebase FireStore
      //show success message
      //move to verify email screen
    } catch (e) {
      //Show some generic error to user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove Loader
      TFullScreenLoader.stopLoading();
    }
  }
}
