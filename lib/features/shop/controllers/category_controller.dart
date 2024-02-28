import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
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
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Load selected category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      // fetch sub-categories from categoryId
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
      return [];
    }
  }

  /// Get category or sub-category products
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    // fetch limited 4 products against each subCategory
    final products = await ProductRepository.instance
        .getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
  }
}
