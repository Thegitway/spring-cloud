class Product {
  String? name;
  double? price;
  String? quantity;

  Product(this.name, this.price, this.quantity);

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
  }
}
