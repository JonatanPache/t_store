import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({super.key, this.itemCount = 4});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
      itemBuilder: (_, __) => const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Image
          TShimmerEffect(width: 120, height: 120),
          SizedBox(height: TSizes.spaceBtwItems),

          /// Text
          Column(
            children: [
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TShimmerEffect(width: 160, height: 15),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TShimmerEffect(width: 110, height: 15),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TShimmerEffect(width: 160, height: 15),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TShimmerEffect(width: 160, height: 15),
              Spacer(),
            ],
          ),

        ],
      ),
    );
  }
}
