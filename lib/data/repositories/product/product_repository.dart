import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/services/firebase_storage_service.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/exceptions/firebase_exception.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

/// Repository class for managing product-related data and operations.
class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// Firestore instance for database interactions
  final _db = FirebaseFirestore.instance;

  /// Function to get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Product').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
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

  /// Function to get featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Product').where('IsFeatured', isEqualTo: true).get();
      return snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
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

  /// Get Products based on the Query
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
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

  /// Get Products for brand
  Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1 }) async {
    try {
      final querySnapshot = limit == -1 ? await _db.collection('Products').where('Brand.Id',isEqualTo: brandId).get():
      await _db.collection('Products').where('Brand.Id',isEqualTo: brandId).limit(limit).get();
      final products = querySnapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
      return products;
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


  /// Get Products for brand
  Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = 4 }) async {
    try {
      // query to get all documents where productId matches the provided catgoryId and Fetch limited or unlimited based on limit
      final productCategoryQuery = limit == -1 ? await _db.collection('ProductCategory').where('categoryId',isEqualTo: categoryId).get():
      await _db.collection('ProductCategory').where('categoryId',isEqualTo: categoryId).limit(limit).get();

      // extract productIds from the documents
      List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();

      // query to get all documents where the brandId is in the list of brandIds, FieldPath.docuemtnId to query docuemtns in COllections
      final productsQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();

      // extract brand names or other relevant data from documents
      List<ProductModel> products = productsQuery.docs.map((document) => ProductModel.fromSnapshot(document)).toList();

      return products;
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


  /// Get Products based on the Query
  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
    try {
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

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







  /// Upload dummy data to the cloud
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      // loop through each category
      for (var product in products) {
        // get imageData link from the local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // upload image and get its url
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // assign URL to Category.image attribute
        product.thumbnail = url;

        // product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            // get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // upload image and get its url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            // assign URL to product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        // upload variation images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            // upload image and get its url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            // assign URL to product.thumbnail attribute
            variation.image = url;
          }
        }

        // store product in firestore
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TFormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong: ${e.toString()}.';
    }
  }
}
