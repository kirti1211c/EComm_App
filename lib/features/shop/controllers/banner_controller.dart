import 'package:get/get.dart';

import '../../../data/repositories/banners/banners_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController{
  static BannerController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel> []. obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async{
    try{
      // Show Loader while loading categories
      isLoading. value = true;

      // Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);

    }catch(e){
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }finally{
      //Remove Loader
      isLoading. value = false;
    }
  }
}