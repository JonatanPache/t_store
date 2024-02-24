
class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({
    this.name,
    this.values,
  });

  /// Convert model to JSON structure for sorting data in Firebase
  toJson() {
    return {
      'Name': name,
      'Values': values,
    };
  }

  /// Map json oriented document snapshot from firebase to Category Model
  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    );
  }
}
