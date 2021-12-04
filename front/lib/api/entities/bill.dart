import 'customer.dart';

class Bill {
  DateTime? billingDate;
  String? customerID;
  Customer? customer;

  Bill(this.billingDate, this.customer, this.customerID);

  Bill.fromJson(Map<String, dynamic> json) {
    billingDate = json['billingDate'] != null
        ? DateTime.parse(json['billingDate'] as String)
        : null;
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    customerID = json['customerId'];
  }
}
