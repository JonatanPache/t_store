import 'package:flutter/material.dart';
import 'package:t_store/colors.dart';
import 'package:t_store/common/style/shadows.dart';
import 'package:t_store/common/widgets/rounded_container.dart';
import 'package:t_store/common/widgets/rounded_image.dart';
import 'package:t_store/help.dart';
import 'package:t_store/utils/sizes.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: THelperFunctions.isDarkMode(context) ? TColors.dark: TColors.light
      ),
      child: Column(
        children: [
          TRoundedContainer(
            height: 180,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.dark: TColors.light,
            child: Stack(
              children: [
                const TRoundedImage(imageUrl: '', applyImageRadius: true,),
                TRoundedContainer(
                  radius: TSizes.sm,
                  backgroundColor: TColors.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                  child: Text('%25', ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
