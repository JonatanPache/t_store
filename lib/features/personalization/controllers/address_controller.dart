import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/circular_loader.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/data/repositories/address/address_repository.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/features/personalization/screens/address/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/network/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  /// Variables
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// init user data when Home Screen appears
  @override
  void onInit() {
    super.onInit();
  }

  /// Fetch address-user record
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  /// Fetch address-user record
  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
          title: '',
          onWillPop: () async {
            return false;
          },
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: const TCircularLoader());

      /// clear the selected field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      /// assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      /// set the selected field to true for the newly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Error in Selection', message: e.toString());
    }
  }

  /// Add new address
  Future addNewAddress() async {
    try {
      /// start loading
      TFullScreenLoader.openLoadingDialog(
          'Storing Address...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
          selectedAddress: true);
      final id = await addressRepository.addAddress(address);

      /// Update selected address
      address.id = id;

      /// remove loader
      TFullScreenLoader.stopLoading();

      /// show success message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully.');

      /// refresh addressees data
      refreshData.toggle();

      /// reset fields
      resetFormField();

      /// redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  /// reset form
  void resetFormField() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  Future<dynamic> selectNewAddresPopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(TSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TSectionHeading(
                        title: 'Select Address', showActionButton: false),
                    FutureBuilder(
                      future: getAllUserAddresses(),
                      builder: (_, snapshot) {
                        final response =
                            TCloudHelperFunctions.checkMultiRecordState(
                                snapshot: snapshot);
                        if (response != null) return response;

                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => TSingleAddress(
                            address: snapshot.data![index],
                            onTap: () async {
                              await selectAddress(snapshot.data![index]);
                              Get.back();
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: TSizes.defaultSpace * 2),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text('Add new address'),
                        onPressed: () => Get.to(
                          () => const AddNewAddressScreen(),
                        ),
                        
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
