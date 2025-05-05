class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'SKU': sku,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['Id']?.toString() ?? '',
      sku: data['SKU']?.toString() ?? '',
      image: data['Image']?.toString() ?? '',
      description: data['Description']?.toString() ?? '',
      price: (data['Price'] as num?)?.toDouble() ?? 0.0,
      salePrice: (data['SalePrice'] as num?)?.toDouble() ?? 0.0,
      stock: (data['Stock'] as num?)?.toInt() ?? 0,
      attributeValues: data['AttributeValues'] != null
          ? (data['AttributeValues'] as Map<String, dynamic>)
              .map((k, v) => MapEntry(k, v.toString()))
          : {},
    );
  }
}
