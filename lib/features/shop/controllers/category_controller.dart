import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load category data
  Future<void> fetchCategories() async {
    try {
      // show loader while loading categories
      isLoading.value = true;

      // fetch categories from data source
      final categories = await _categoryRepository.getAllCategories();

      // update the categories list
      allCategories.assignAll(categories);

      // filtered featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Load selected category data

  /// Get category or sub-category products
}