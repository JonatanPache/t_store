import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/models/address_model.dart';

/// Repository class for managing address-related data and operations.
class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  /// FireStore instance for database interactions
  final _db = FirebaseFirestore.instance;

  /// Function to get user-addresses
  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes';
      }
      final result = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .get();
      return result.docs
          .map((e) => AddressModel.fromDocumentSnapshot(e))
          .toList();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to update address
  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .doc(addressId)
          .update({'SelectedAddress': selected});
    } catch (e) {
      throw 'Unable to update address. Please try again';
    }
  }

  /// Function to update address
  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;
      final currentAddress = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
