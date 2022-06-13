class NewsModel {
  final int id;
  String title, image, content, createdAt;

  NewsModel( {
    required this.id,
    required this.title,
    required this.image,
    required this.content,
    required this.createdAt } );


  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        id: int.tryParse( json['id'] ) ?? 0,
        title: json['title'],
        image: json['image'],
        content: json['content'],
        createdAt: json['createdAt']
    );
  }
  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'title': title,
        'image': image,
        'content': content,
        'createdAt': createdAt
      };

}