class Category {
  late String name;

  Category({required this.name});

  Category.fromJson(Map<String, dynamic> json) {
    name:
    json['name'];
  }
}
