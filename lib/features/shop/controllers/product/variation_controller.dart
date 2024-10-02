import 'package:get/get.dart';

import '../../models/product_model.dart';
import '../../models/product_variation_model.dart';
import 'cart_controller.dart';
import 'images_controller.dart';

class VariationController extends GetxController{
  static VariationController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  /// - Select Attribute, and Variation
  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;
    final selectedVariation = product.productVariations!. firstWhere(
        (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty(),
    );
    // Show the selected Variation image as a Main Image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }


    this.selectedVariation.value = selectedVariation;

    getProductVariationStockStatus();
  }

  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations
          .where ((variation) =>
            // Check Empty / Out of Stock Attributes
            variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0)
          // Fetch all non-empty attributes of variations
          .map ((variation) => variation.attributeValues[attributeName])
          .toSet();
    return availableVariationAttributeValues;
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    // If selectedAttributes contains 3 attributes and current variation contains 2 then return.
    if (variationAttributes.length != selectedAttributes.length) return false;
    // If any of the attributes is different then return. e.g. [Green, Large] × [Green, Small]
    for (final key in variationAttributes.keys) {
      // Attributes(Key] = Value which could be (Green, Small, Cotton) etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice: selectedVariation.value.price).toString();
  }

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}