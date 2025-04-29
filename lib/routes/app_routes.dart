import 'package:deal_nest/features/screens/password_configuration/forgot_password.dart';
import 'package:deal_nest/features/shop/screens/home/home.dart';
import 'package:deal_nest/routes/routes.dart';
import 'package:get/get.dart';

import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/screens/login/login.dart';
import '../features/screens/onboarding/onboarding.dart';
import '../features/screens/signup/signup.dart';
import '../features/screens/signup/verify_email.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/product_reviews/product_reviews.dart';
import '../features/shop/screens/store/store.dart';
import '../features/shop/screens/wishlist/wishlist.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: MyRoutes.home, page: () => HomeScreen()),
    GetPage(name: MyRoutes.store, page: () => StoreScreen()),
    GetPage(name: MyRoutes.favourites, page: () => FavouriteScreen()),
    GetPage(name: MyRoutes.settings, page: () => SettingsScreen()),
    GetPage(name: MyRoutes.productReviews, page: () => ProductReviewsScreen()),
    GetPage(name: MyRoutes.order, page: () => const OrderScreen()),
    GetPage(name: MyRoutes.checkout, page: () => CheckoutScreen()),
    GetPage(name: MyRoutes.cart, page: () => CartScreen()),
    GetPage(name: MyRoutes.userProfile, page: () => ProfileScreen()),
    GetPage(name: MyRoutes.userAddress, page: () => UserAddressScreen()),
    GetPage(name: MyRoutes.signup, page: () => SignupScreen()),
    GetPage(name: MyRoutes.verifyEmail, page: () => VerifyEmailScreen()),
    GetPage(name: MyRoutes.signIn, page: () => LoginScreen()),
    GetPage(name: MyRoutes.forgetPassword, page: () => ForgotPassword()),
    GetPage(name: MyRoutes.onBoarding, page: () => OnboardingScreen()),

// Add more GetPage entries as needed
  ];
}
