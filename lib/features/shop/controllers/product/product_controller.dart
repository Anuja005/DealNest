import 'package:get/get.dart';

import '../../../../data/repositories/product/product_repository.dart';
import '../../../../utils/constants/enums.dart';
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
      // Show loading while loading products
      isLoading.value = true;

      // Fetch products
      final products = await productRepository.getFeaturedProducts();

      // Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Get the product price or price range for single or variable products
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // For single products, use salePrice if available and valid, otherwise use price
    if (product.productType == ProductType.single.toString()) {
      double price = product.salePrice > 0 ? product.salePrice : product.price;
      if (price > 0) {
        smallestPrice = price;
        largestPrice = price;
      }
    } else {
      // For products with variations
      if (product.productVariations == null ||
          product.productVariations!.isEmpty) {
        return 'N/A';
      }

      // Loop through all variations to find the smallest and largest prices
      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;
        // Only consider prices greater than 0.0
        if (priceToConsider > 0.0) {
          if (priceToConsider < smallestPrice) {
            smallestPrice = priceToConsider;
          }
          if (priceToConsider > largestPrice) {
            largestPrice = priceToConsider;
          }
        }
      }
    }

    // Return the price range or single price if found, otherwise return 'N/A'
    if (smallestPrice == double.infinity) {
      return 'N/A'; // No valid price found
    } else if (smallestPrice == largestPrice) {
      return '\$${smallestPrice.toStringAsFixed(1)}'; // Same price for all variations
    } else {
      return '${smallestPrice.toStringAsFixed(1)} - \$${largestPrice.toStringAsFixed(1)}'; // Price range with $ only on largest price
    }
  }

  /// Calculate Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// Check Product Stock Status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
