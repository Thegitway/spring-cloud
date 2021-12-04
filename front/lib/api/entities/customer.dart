class Customer {
  String? name;
  String? email;

  Customer(this.name, this.email);

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }
}
