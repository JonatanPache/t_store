import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/exceptions/firebase_exception.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

/// Repository class for user-related operations.
class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((document) =>
          BrandModel.fromSnapshot(document)).toList();
      return result;
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

/// Get brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get all documents where categoryId matches the provides categoryId
      final brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId',isEqualTo: categoryId).limit(2).get();
      // extract brandIds from the documents
      final brandsIds = brandCategoryQuery.docs.map((document) =>
          document['brandId'] as String).toList();

      // Query to get all documents where categoryId matches the provides categoryId
      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId,whereIn: brandsIds).limit(2).get();
      // extract brand names or other relevant data from the documents
      List<BrandModel> brands = brandsQuery.docs.map((document) =>
          BrandModel.fromSnapshot(document)).toList();
      return brands;
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