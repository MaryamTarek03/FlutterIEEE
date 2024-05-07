class ProductsModel {
  late int id;
  late double price;
  late double rating;
  late int quantity;
  late String title;
  late String description;
  late String brand;
  late String category;
  late String thumbnail;
  late List<String> images;
  ProductsModel.data(Map<String, dynamic> productsData) {
    id = productsData['id'];
    price = productsData['price'];
    rating = productsData['rating'];
    quantity = productsData['stock'];
    title = productsData['title'];
    description = productsData['description'];
    brand = productsData['brand'];
    category = productsData['category'];
    thumbnail = productsData['thumbnail'];
    images = List<String>.from(productsData['images']);
  }
}
