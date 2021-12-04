import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:front/api/entities/product.dart';

import 'bill.dart';

class DioService {
  Dio dio = Dio(BaseOptions(
      // baseUrl: 'http://host.docker.internal:',
      connectTimeout: 30000,
      contentType: 'application/json',
      responseType: ResponseType.json));

  Future getBilling() async {
    try {
      var response = await dio.get('http://localhost:8083/bills');
      if (response.statusCode == 200) {
        var bills = <Bill>[];
        for (var i in jsonDecode(response.data)['_embedded']['bills']) {
          bills.add(Bill.fromJson(i));
        }
        return bills;
      }
    } catch (e) {
      print(e);
    }
  }

  Future getProduct() async {
    try {
      var response = await dio.get('http://localhost:8082/products');
      print(response.data);
      if (response.statusCode == 200) {
        var prods = <Product>[];
        for (var i in response.data['products']) {
          prods.add(Product.fromJson(i));
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
