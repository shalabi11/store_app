import 'dart:async';

import 'package:store_app/helper/api.dart';

class GetAllCategoryServices {
  Future<List<dynamic>> getAllCategory() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
