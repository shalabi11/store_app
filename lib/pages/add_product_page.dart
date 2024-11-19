import 'dart:developer';
// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/model/product_model.dart';
import 'package:store_app/services/post_services.dart';
// import 'package:store_app/services/put_servers.dart';
import 'package:store_app/widget/custom_container_button.dart';
import 'package:store_app/widget/custom_text_field.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({
    super.key,
  }) : super();
  static String id = 'update page';

  @override
  State<AddProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<AddProductPage> {
  // ProductModel ?product;
  // String? productName, price, desc, image, category, id;

  bool isLoading = false;
  ProductModel? product;

  @override
  Widget build(BuildContext context) {
    // ProductModel product =
    //     ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Product ',
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
                  hintText: 'id ',
                  onChanged: (p0) {
                    product?.id = p0;
                  },
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'categor ',
                  onChanged: (p0) {
                    product!.category = p0;
                  },
                  // textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'product name ',
                  onChanged: (p0) {
                    product!.title = p0;
                  },

                  // textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'price ',
                  onChanged: (p0) {
                    product!.price = p0.toString();
                  },
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onChanged: (p0) {
                      product!.description = p0;
                    },
                    hintText: 'descreption'),
                // textInputType: TextInputType.number,

                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'image ',
                  onChanged: (p0) {
                    product!.image = p0;
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
                      await addProduct();
                      try {
                        log('success');
                        Navigator.pop(context);
                      } catch (e) {
                        // TODO
                      }
                      isLoading = false;
                      setState(() {});
                      log(product!.category.toString());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addProduct() async {
    await PostServices().postServers(
      id: product!.id!,
      title: product!.title,
      description: product!.description,
      price: product!.price == null ? 'None' : product!.price.toString(),
      // ignore: unnecessary_null_comparison
      image: product!.image,
      category: product!.category,
    );
    // log(product.id.toString());
  }
}
