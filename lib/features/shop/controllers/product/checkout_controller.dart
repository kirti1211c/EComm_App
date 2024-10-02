import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../models/payment_method_model.dart';
import '../../screens/checkout/widgets/payment_tile.dart';

class CheckoutController extends GetxController{
  static CheckoutController get instance => Get. find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel. empty().obs;

  @override
  void onInit() {
    super.onInit();
    selectedPaymentMethod. value = PaymentMethodModel (name: 'Paypal', image: TImages.paypal);
  }

  Future<dynamic> selectPaymentMethod (BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(title: 'Select Payment Method', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              TPaymentTile(paymentMethod: PaymentMethodModel (name: 'Paypal', image: TImages.paypal)),
              const SizedBox(height: TSizes.spaceBtwItems/2),

              TPaymentTile(paymentMethod: PaymentMethodModel (name: 'Google Pay', image: TImages.paypal)),
              const SizedBox(height: TSizes.spaceBtwItems/2),

              TPaymentTile(paymentMethod: PaymentMethodModel (name: 'Credit/Debit Card', image: TImages.paypal)),
              const SizedBox(height: TSizes.spaceBtwItems/2),

              TPaymentTile(paymentMethod: PaymentMethodModel (name: 'NetBanking', image: TImages.paypal)),
              const SizedBox(height: TSizes.spaceBtwItems/2),

              const SizedBox(height: TSizes.spaceBtwSections),


            ],
          ),
        ),
      )
    );
  }

}