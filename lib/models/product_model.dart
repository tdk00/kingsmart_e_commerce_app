class ProductModel {
  final String id, title, summary, image;
  final double price, discount;
  final bool isFavorite;

  ProductModel(this.id, this.title, this.summary, this.image, this.price, this.discount, this.isFavorite);

  Map<String, dynamic> toJson() =>
      {
        'title': title,
        'summary': summary,
        'image': image,
        'priceAfterDiscount': price,
        'discount': discount,
        'isFavorite': isFavorite
      };
}