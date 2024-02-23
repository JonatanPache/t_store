import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TDummyData {
  // Banners
  static final List<BannerModel> banners = [
    BannerModel(targetScreen: '/guitar', active: true, imageUrl: TImages.promoBanner1),
    BannerModel(targetScreen: '/stomp', active: true, imageUrl: TImages.promoBanner2),
    BannerModel(targetScreen: '/drum', active: true, imageUrl: TImages.promoBanner3),
    BannerModel(targetScreen: '/strings', active: true, imageUrl: TImages.promoBanner4),
  ];

  // List of categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Electric Guitar', image: TImages.electricGuitarIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Acoustic Guitar', image: TImages.acousticGuitarIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Electric Bass', image: TImages.bassIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Drums', image: TImages.drumIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Stomp Box', image: TImages.stompBoxIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Amplifiers', image: TImages.ampIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Strings', image: TImages.stringsIcon, isFeatured: true),
    CategoryModel(id: '8', name: 'Keyboards', image: TImages.keyboardIcon, isFeatured: true),

    // subcategories

    // CategoryModel(id: '8', name: 'Keyboards', image: TImages.keyboardIcon, isFeatured: false),
  ];
}