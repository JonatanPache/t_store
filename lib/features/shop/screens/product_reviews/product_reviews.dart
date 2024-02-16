import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/t_appbar.dart';
import 'package:t_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TProductReviewsScreen extends StatelessWidget {
  const TProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Reviews and Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('sadfsdfsdf'),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            // overall product ratings
            const TOverallProductRating(),
            const TRatingBarIndicator(rating: 3.5,),
            Text('12.66', style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: TSizes.spaceBtwSections,),

            // user reviews list
            const UserReviewCard()
          ],
        ),
      ),
    );
  }
}

