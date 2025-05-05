class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  toJson() {
    return {'Name': name, 'Values': values};
  }

  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name: data['Name']?.toString() ?? '',
      values: data['Values'] != null
          ? (data['Values'] as List<dynamic>).map((e) => e.toString()).toList()
          : [],
    );
  }
}
