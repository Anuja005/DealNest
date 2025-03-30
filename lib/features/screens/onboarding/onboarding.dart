import 'package:deal_nest/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:deal_nest/features/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:deal_nest/features/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:deal_nest/features/screens/onboarding/widgets/onboarding_page.dart';
import 'package:deal_nest/features/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:deal_nest/utils/constants/image_strings.dart';
import 'package:deal_nest/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          OnBoardingSkip(),

          ///Dot Navigation SmoothPageIndicator
          OnBoardingDotNavigation(),

          ///Circular Button
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}
