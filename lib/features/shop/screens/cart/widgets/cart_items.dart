import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:t_store/common/widgets/products/cart/cart_item.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});
  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemCount: 4,
      itemBuilder: (_, index) => Column(
        children: [
          // cart item
          const TCartItem(),
          if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),

          // add remove button row with total price
          if(showAddRemoveButtons) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // extra space
                  SizedBox(width: 70),

                  // add remove button
                  TProductQuantityWithAddRemoveButton(),
                ],
              ),

              // product total price
              TProductPriceText(price: '325')
            ],
          )
        ],
      ),
    );
  }
}
