import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/t_appbar.dart';
import 'package:t_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/shop/controllers/all_products_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: TAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              // check the state of the future builder snapshot
              const loader = TVerticalProductShimmer();

              final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

              // return appropriate widget based on snapshot state
              if(widget != null) return widget;

              final products = snapshot.data!;

              return TSortableProducts(products: products);
            }),
      ),
    );
  }
}
