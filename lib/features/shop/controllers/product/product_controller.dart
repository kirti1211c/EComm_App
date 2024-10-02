import 'package:get/get.dart';

import '../../../../data/repositories/product/product_repository.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/product_model.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      // Show loader while loading Products
      isLoading.value = true;

      // Fetch Products
      final products = await productRepository.getFeaturedProducts();

      //Assign Products
      featuredProducts.assignAll(products);
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e. toString());
    }finally{
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // Fetch Products
      final products = await productRepository.getFeaturedProducts();
      return products;
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e. toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variations exist, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    }
    else {
      // Calculate the smallest and largest prices among variations
      for (var variation in product.productVariations!) {
        // Determine the price to consider (sale price if available, otherwise regular price)
        double priceToConsider = variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price;
        // Update smallest and largest prices
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      // If smallest and largest prices are the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        // Otherwise, return a price range
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus (int stock){
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }

}