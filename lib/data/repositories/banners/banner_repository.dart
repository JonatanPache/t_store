import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/exceptions/firebase_exception.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

/// Repository class for banner operations.
class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      final list = result.docs.map((snapshot) => BannerModel.fromSnapshot(snapshot)).toList();
      return list;
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TFormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

}