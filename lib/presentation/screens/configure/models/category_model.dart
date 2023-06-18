class CategoryModel {
  late int id;
  late String name;

  CategoryModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }

  CategoryModel({
    required this.id,
    required this.name,
  });
}
