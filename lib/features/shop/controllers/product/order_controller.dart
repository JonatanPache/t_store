import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/order/order_repository.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:t_store/features/shop/models/order_model.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());



  /// fetch user order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;

    } catch(e){
      TLoaders.warningSnackBar(title: 'Oh snap',message:e.toString());
      return [];
    }
  }


  void processOrder(double totalAmount) async {
    try {
      // start loader
      TFullScreenLoader.openLoadingDialog('Processing your order', TImages.docerAnimation);

      // get user auth id
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      // add details
      final order = OrderModel(
        // generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // set date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList()
      );

      // save the order to firestore
      await orderRepository.saveOrder(order, userId);

      // update the cart status
      cartController.clearCart();
      
      // show success screen
      Get.off( () => SuccessScreen(
        image: TImages.docerAnimation,
        title: 'Payment Success',
        subTitle: 'Your item will be shipped soon!',
        onPressed: () => Get.offAll( () => const NavigationMenu()),
      ));

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

}