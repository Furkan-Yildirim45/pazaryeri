class ProductModel {
  static int _idCounter = 1;

  final int productId;
  final String? productUrl;
  final String? productBrand;
  final double? productPrice;
  final String? productDate;
  final String? seller;
  final String? productRating;
  final String? productName;
  bool? isFavorite;

  ProductModel({
    required this.productId,
    this.productUrl,
    this.productBrand,
    this.productPrice,
    this.productDate,
    this.seller,
    this.productRating,
    this.productName,
    this.isFavorite = false,
  });

  factory ProductModel.create({
    String? productUrl,
    String? productBrand,
    double? productPrice,
    String? productDate,
    String? seller,
    String? productRating,
    String? productName,
    bool? isFavorite = false,
  }) {
    return ProductModel(
      productId: _idCounter++,
      productUrl: productUrl,
      productBrand: productBrand,
      productPrice: productPrice,
      productDate: productDate,
      seller: seller,
      productRating: productRating,
      productName: productName,
      isFavorite: isFavorite,
    );
  }
}