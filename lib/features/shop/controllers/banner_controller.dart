import 'package:get/get.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  // variables
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// update page navigational dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  /// fetch banners
  Future<void> fetchBanners() async {
    try {
      // show loader while loading categories
      isLoading.value = true;

      // fetch categories from data source
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // update the categories list
      this.banners.assignAll(banners);

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}