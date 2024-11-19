import 'package:store_app/helper/api.dart';
import 'package:store_app/model/product_model.dart';

class PostServices {
  Future<ProductModel> postServers(
      {required String id,
      required String title,
      required String description,
      required String price,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
      token: '',
    );
    return ProductModel.fromJson(data);
  }
}
