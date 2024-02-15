import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/t_appbar.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:t_store/common/widgets/products/cart/cart_item.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            itemCount: 4,
            itemBuilder: (_, index) => const Column(
              children: [
                TCartItem(),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // extra space
                        const SizedBox(width: 70,),

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
          ),
        ),
      ),
      bottomNavigationBar: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace), child: ElevatedButton(onPressed: (){},child: const Text('Checkout \$325.0'),),),
    );
  }
}
