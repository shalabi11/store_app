import 'dart:developer';

import 'package:store_app/helper/api.dart';
import 'package:store_app/model/product_model.dart';

class GetAllProductServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    // List<dynamic> data = response;
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    log(productsList.length.toString());
    return productsList;
  }
}
