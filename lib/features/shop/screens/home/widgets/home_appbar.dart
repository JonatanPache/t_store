import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/common/widgets/products/product_cards/cart_menu_icon.dart';
import 'package:t_store/common/widgets/appbar/t_appbar.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Guitar Store', style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),),
          Text('You can rock and roll ', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),)
        ],
      ),
      actions: [TCartCounterIcon(iconColor: TColors.white, onPressed: (){})],
    );
  }
}
