import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';

class TBrandShimmer extends StatelessWidget {
  const TBrandShimmer({super.key, this.itemCount = 4});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: 4,
      mainAxisExtent: 80,
      itemBuilder: (_, __) => const TShimmerEffect(width: 300, height: 80),
    );
  }
}
