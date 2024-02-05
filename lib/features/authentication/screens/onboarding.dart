import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_store/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:t_store/features/authentication/screens/widgets/onboarding_dot_navigation.dart';
import 'package:t_store/features/authentication/screens/widgets/onboarding_next_button.dart';
import 'package:t_store/features/authentication/screens/widgets/onboarding_page.dart';
import 'package:t_store/features/authentication/screens/widgets/onboarding_skip.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Stack(
      children: [
        // Horizontal scrollable pages
        PageView(
          controller: controller.pageController,
          children: const [
            OnBoardingPage(
              image: TImages.onBoardingImage1,
              title: TText.onBoardingTitle1,
              subTitle: TText.onBoardingSubTitle1,
            ),
            OnBoardingPage(
              image: TImages.onBoardingImage2,
              title: TText.onBoardingTitle2,
              subTitle: TText.onBoardingSubTitle2,
            ),
            OnBoardingPage(
              image: TImages.onBoardingImage3,
              title: TText.onBoardingTitle3,
              subTitle: TText.onBoardingSubTitle3,
            ),
          ],
        ),

        // skip button
        const OnBoardingSkip(),

        // dot navigation indicator
        const OnBoardingDotNavigation(),

        const OnBoardingNextButton()
      ],
    );
  }
}

