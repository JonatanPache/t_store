import 'package:flutter/material.dart';
import 'package:t_store/utils/colors.dart';
import 'package:t_store/common/cart_menu_icon.dart';
import 'package:t_store/common/t_appbar.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('title', style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),),
          Text('subtitle', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),)
        ],
      ),
      actions: [TCartCounterIcon(iconColor: TColors.white, onPressed: (){})],
    );
  }
}
