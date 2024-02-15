import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // image
        const TRoundedImage(
          imageUrl: TImages.productImage3,
          width: 60,
          height: 60,
        ),
        const SizedBox(
          width: TSizes.spaceBtwSections,
        ),

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Gibson'),
              const Flexible(child: TProductTitleText(title: 'asdbjashbdjahs d')),

              // attributes
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Green', style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'Size', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'UK 40', style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}