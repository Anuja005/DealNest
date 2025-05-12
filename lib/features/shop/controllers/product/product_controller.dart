import 'package:get/get.dart';

import '../../../../data/repositories/product/product_repository.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      final products = await productRepository.getFeaturedProducts();
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final products = await productRepository.getFeaturedProducts();
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    if (product.productVariations == null ||
        product.productVariations!.isEmpty) {
      // Single product: no dollar sign
      double price = product.salePrice > 0 ? product.salePrice : product.price;
      if (price > 0) {
        return price.toStringAsFixed(1);
      } else {
        return 'N/A';
      }
    } else {
      // Variable product: dollar sign on largest price
      double smallestPrice = double.infinity;
      double largestPrice = 0.0;
      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;
        if (priceToConsider > 0.0) {
          if (priceToConsider < smallestPrice) {
            smallestPrice = priceToConsider;
          }
          if (priceToConsider > largestPrice) {
            largestPrice = priceToConsider;
          }
        }
      }
      if (smallestPrice == double.infinity) {
        return 'N/A';
      } else if (smallestPrice == largestPrice) {
        return '\$${smallestPrice.toStringAsFixed(1)}';
      } else {
        return '${smallestPrice.toStringAsFixed(1)} - \$${largestPrice.toStringAsFixed(1)}';
      }
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
