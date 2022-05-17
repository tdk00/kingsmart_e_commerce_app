class ProductModel {
  final int id;
  final String barkod, title, summary, image;
  final double price, oldPrice,  discount;
  final bool isFavorite;

  const ProductModel({
    required this.id,
    required this.barkod,
    required this.title,
    required this.summary,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.isFavorite,

  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    var is_favorite = int.tryParse( json['isFavorite'] ) ?? 0;
    return ProductModel(
      id: int.tryParse( json['id'] ) ?? 0,
      barkod: json['barkod'],
      title: json['title'],
      summary: json['summary'],
      image: json['image'],
      price: double.tryParse( json['price'] ) ?? 0,
      oldPrice: double.tryParse( json['oldPrice'] )  ?? 0,
      discount: double.tryParse( json['discount'] )  ?? 0,
      isFavorite: is_favorite > 0 ,
    );

  }



  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'barkod': barkod,
        'title': title,
        'summary': summary,
        'image': image,
        'price': price,
        'oldPrice': oldPrice,
        'discount': discount,
        'isFavorite': isFavorite,
      };
}
