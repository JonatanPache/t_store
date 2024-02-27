import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  final String brandId;
  final String categoryId;

  BrandCategoryModel({
    required this.brandId,
    required this.categoryId
});

  /// Convert model to JSON structure for sorting data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'BrandId': brandId,
      'CategoryId': categoryId,
    };
  }

  /// Map json oriented document snapshot from firebase to Category Model
  factory BrandCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BrandCategoryModel(
      brandId: data['BrandId'] as String,
      categoryId: data['CategoryId'] as String,
    );
  }
}