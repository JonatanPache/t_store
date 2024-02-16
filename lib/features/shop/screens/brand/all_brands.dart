import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/t_appbar.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // heading
              const TSectionHeading(title: 'Brands'),
              const SizedBox(height: TSizes.spaceBtwItems),

              // brands
              TGridLayout(
                mainAxisExtent: 80,
                itemCount: 10,
                itemBuilder: (context, index) => TBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(
                    () => TBrandCard(showBorder: true, onTap: () => Get.to( () => const BrandProducts()),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
