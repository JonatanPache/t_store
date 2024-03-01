import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    // final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Heading address
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () => addressController.selectNewAddresPopup(context),
        ),

        /// display information about address
        addressController.selectedAddress.value.id.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Coding with T',
                      style: Theme.of(context).textTheme.bodyLarge),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.grey, size: 16),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Text('+591 6586402',
                          style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.location_history,
                          color: Colors.grey, size: 16),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Expanded(
                        child: Text(
                          'South kiana',
                          style: Theme.of(context).textTheme.bodyMedium,
                          softWrap: true,
                        ),
                      )
                    ],
                  )
                ],
              )
            : Text('Select Address',
                style: Theme.of(context).textTheme.bodyMedium)
      ],
    );
  }
}
