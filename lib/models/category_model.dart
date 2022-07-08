class Category {
  int? _totalCategories;
  late List<Categories> _categories;
  List<Categories> get categories => _categories;

  Category({required totalCategories, required categories}){
    _totalCategories = totalCategories;
    _categories = categories;
  }

  Category.fromJson(Map<String, dynamic> json) {
    _totalCategories = json['total_categories'];
    if (json['categories'] != null) {
      _categories = <Categories>[];
      json['categories'].forEach((v) {
        _categories.add(Categories.fromJson(v));
      });
    }
  }
}

class Categories {
  int? id;
  String? name;
  String? createdAt;

  Categories({this.id, this.name, this.createdAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
  }

}