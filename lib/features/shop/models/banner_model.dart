import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.targetScreen,
    required this.active,
    required this.imageUrl,
  });

  /// Convert model to JSON structure for sorting data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'Active': active,
      'TargetScreen': targetScreen,
    };
  }

  /// Map json oriented document snapshot from firebase to Category Model
  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageUrl: data['ImageUrl'] ?? '',
      active: data['Active'] ?? false,
      targetScreen: data['TargetScreen'] ?? '',
    );
  }
}
