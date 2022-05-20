class CategoryModel {
  final int id;
  final String title, image;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.image

  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: int.tryParse( json['id'] ) ?? 0,
      title: json['title'],
      image: json['image']
    );

  }
  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'title': title,
        'image': image
      };
}
