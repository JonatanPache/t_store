import 'package:flutter/material.dart';
import 'package:t_store/common/search_container.dart';
import 'package:t_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/utils/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header

            // App bar
            THomeAppBar(),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            // searchbar
            TSearchContainer(text: 'Search in store'),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            // categories
            Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace),
              child: Column(
                children: [
                  //  heading
                  TSectionHeading(
                    title: 'Popular Categories',
                    showActionButton: false,
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  // categories
                  THomeCategories()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
