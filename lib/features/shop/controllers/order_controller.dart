import 'package:ecomm/features/shop/controllers/product/cart_controller.dart';
import 'package:ecomm/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecomm/features/shop/screens/home/home.dart';
import 'package:ecomm/navigation_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/widgets/success_screen/success_screen.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/orders/order_repository.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../personalization/controllers/address_controller.dart';
import '../models/order_model.dart';

class OrderController extends GetxController{
  static OrderController get instance => Get.find();
  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get. put(OrderRepository());


  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders. warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void processOrder (double totalAmount) async {
    try {
      // Start Loader
      TFullScreenLoader.openLoadingDialog('Processing your order', TImages.docerAnimation);

      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
        // Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // Set Date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      await orderRepository.saveOrder(order, userId);
      cartController.clearCart();

      Get.off(() => SuccessScreen(
          image: TImages.successfulPaymentIcon,
          title: 'Payment Success!',
          subTitle: 'Your item will be shipped soon!' ,
          onPressed: () => Get. offAll(() => const NavigationMenu()),
      ));

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}