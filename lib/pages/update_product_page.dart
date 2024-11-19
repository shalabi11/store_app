import 'dart:developer';
// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/model/product_model.dart';
import 'package:store_app/services/put_servers.dart';
import 'package:store_app/widget/custom_container_button.dart';
import 'package:store_app/widget/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({
    super.key,
  }) : super();
  static String id = 'update page';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  // ProductModel ?product;
  String? productName, price, desc, image;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product ',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  hintText: 'product name : ${product.title}',
                  onChanged: (p0) {
                    productName = p0;
                  },

                  // textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'price : ${product.price}',
                  onChanged: (p0) {
                    price = p0.toString();
                  },
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onChanged: (p0) {
                      desc = p0;
                    },
                    hintText: 'descreption : ${product.description}'),
                // textInputType: TextInputType.number,

                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'image : ${product.image}',
                  onChanged: (p0) {
                    image = p0;
                  },
                  // textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButon(
                    text: 'Update',
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
                      try {
                        await updateProduct(product);
                        log('success');
                        Navigator.pop(context);
                      } catch (e) {
                        // TODO
                      }
                      isLoading = false;
                      setState(() {});
                      log(productName.toString());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await PutServices().putServers(
        id: product.id.toString(),
        title: productName == null ? product.title : productName!,
        description: desc == null ? product.description : desc!,
        price: price == null ? product.price.toString() : price.toString(),
        image: image == null ? product.image : image!,
        category: product.category);
    log(product.title.toString());
  }
}
