// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:skeletonizer/skeletonizer.dart';
import 'package:store_app/model/product_model.dart';
import 'package:store_app/pages/add_product_page.dart';
import 'package:store_app/pages/update_product_page.dart';
import 'package:store_app/services/get_all_product_services.dart';
import 'package:store_app/widget/custom_card.dart';
import 'package:store_app/widget/loading_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  static String id = ' home page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Trend',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.store_mall_directory),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
        child: FutureBuilder<List<ProductModel>>(
          future: GetAllProductServices().getAllProducts(),
          builder: (context, snapshot) {
            // log(snapshot.data.toString());
            if (snapshot.hasData) {
              List<ProductModel> data = snapshot.data!;
              // setState(() {});
              return GridView.builder(
                  // shrinkWrap: true,
                  clipBehavior: Clip.none,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.5,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, UpdateProductPage.id,
                            arguments: data[index]);
                      },
                      child: CustomCard(
                        productModel: data[index],
                      ),
                    );
                  });
            } else {
              return const LoadingIndecator();
            }
          },
        ),
      ),
      floatingActionButton: IconButton(
        // focusColor: Colors.black,
        color: Colors.white,
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.black)),
        onPressed: () {
          Navigator.pushNamed(context, AddProductPage.id);
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
