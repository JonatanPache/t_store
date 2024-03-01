import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/features/shop/controllers/product/order_controller.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = Get.put(OrderController());

    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {
        // nothing found widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops No Orders Yet!',
          showAction: true,
          actionText: 'Lets fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
          animation: TImages.docerAnimation,
        );

        // helper function handler loader no record or error nessage
        final response = TCloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;

        final orders = snapshot.data!;

        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: TSizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final order = orders[index];

            return TRoundedContainer(
              showBorder: true,
              backgroundColor: dark ? TColors.dark : TColors.light,
              padding: const EdgeInsets.all(TSizes.md),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // row 1
                  Row(
                    children: [
                      // icon
                      const Icon(Iconsax.ship),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),

                      // status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.orderStatusText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(
                                      color: TColors.primary,
                                      fontWeightDelta: 1),
                            ),
                            Text(
                              order.formattedOrderDate,
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          ],
                        ),
                      ),

                      // icon
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.arrow_right_34,
                          size: TSizes.iconSm,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Bottom row
                  Row(
                    children: [
                      // Order NO
                      Expanded(
                        child: Row(
                          children: [
                            // icon
                            const Icon(Iconsax.tag),
                            const SizedBox(width: TSizes.spaceBtwItems / 2),

                            // status and date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.id,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // delivery date
                      Expanded(
                        child: Row(
                          children: [
                            // icon
                            const Icon(Iconsax.calendar),
                            const SizedBox(width: TSizes.spaceBtwItems / 2),

                            // status and date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shipping date',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.formattedDeliveryDate,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
