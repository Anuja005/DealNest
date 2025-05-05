import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deal_nest/features/shop/models/brand_model.dart';
import 'package:deal_nest/features/shop/models/product_attribute_model.dart';
import 'package:deal_nest/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations,
  });

  static ProductModel empty() => ProductModel(
      id: '', title: '', stock: 0, price: 0, thumbnail: '', productType: '');

  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['SKU']?.toString() ?? '',
      title: data['Title']?.toString() ?? '',
      stock: data['Stock'] as int? ?? 0,
      isFeatured: data['IsFeatured'] as bool? ?? false,
      price: (data['Price'] as num?)?.toDouble() ?? 0.0,
      salePrice: (data['SalePrice'] as num?)?.toDouble() ?? 0.0,
      thumbnail: data['Thumbnail']?.toString() ?? '',
      categoryId: data['CategoryId']?.toString() ?? '',
      description: data['Description']?.toString() ?? '',
      productType: data['ProductType']?.toString() ?? '',
      brand: BrandModel.fromJson(data['Brand'] as Map<String, dynamic>),
      images: data['Images'] != null
          ? (data['Images'] as List<dynamic>).map((e) => e.toString()).toList()
          : [],
      productAttributes: data['ProductAttributes'] != null
          ? (data['ProductAttributes'] as List<dynamic>)
              .map((e) =>
                  ProductAttributeModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      productVariations: data['ProductVariations'] != null
          ? (data['ProductVariations'] as List<dynamic>)
              .map((e) =>
                  ProductVariationModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
    );
  }
}
