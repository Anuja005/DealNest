import 'package:deal_nest/features/screens/login/login.dart';
import 'package:deal_nest/features/screens/onboarding/onboarding.dart';
import 'package:deal_nest/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:deal_nest/utils/exceptions/format_exceptions.dart';
import 'package:deal_nest/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Called from main.dart while launch
  @override
  void onReady() {
    //remove native splash screen
    FlutterNativeSplash.remove();
    //redirect to appropriate screen
    screenRedirect();
  }

  ///Function to show Relevant screen
  screenRedirect() async {
    //local Storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    //check if first time launch app
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(
            () => LoginScreen()) //redirect to login screen if not 1st time
        : Get.offAll(
            OnboardingScreen()); //redirect to onboarding screen if 1st time
  }

////                 Email & Password Sign In
  ///Email Auth SignIn
  ///Email Auth Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///ReAuth User
  ///Email Verify
  ///Forgot Password

////                     Social Sign In

  ///Google
  ///Facebook
  ///Logout User
  ///Delete User
}
