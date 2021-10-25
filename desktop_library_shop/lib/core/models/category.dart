class Category {
  Category({
    required this.categoryId,
    required this.name,
    required this.isActive,
  });
  late final int categoryId;
  late final String name;
  late final int isActive;

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    name = json['name'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categoryId'] = categoryId;
    _data['name'] = name;
    _data['isActive'] = isActive;
    return _data;
  }
}
