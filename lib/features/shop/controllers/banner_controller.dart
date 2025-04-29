import 'package:deal_nest/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

import '../../../data/repositories/banners/banner_repository.dart';
import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController {
  ///Variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  ///Update page navigation dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  ///fetch banners
  Future<void> fetchBanners() async {
    try {
// Show Loader while loading banners
      isLoading.value = true;

// Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

// Assign Banners
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
//Remove Loader
      isLoading.value = false;
    }
  }
}
