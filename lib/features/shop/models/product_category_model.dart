import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String productId;
  final String categoryId;

  ProductCategoryModel({
    required this.productId,
    required this.categoryId
  });

  /// Convert model to JSON structure for sorting data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'CategoryId': categoryId,
    };
  }

  /// Map json oriented document snapshot from firebase to Category Model
  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ProductCategoryModel(
      productId: data['ProductId'] as String,
      categoryId: data['CategoryId'] as String,
    );
  }
}