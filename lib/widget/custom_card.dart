import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
// import 'package:icons_flutter/icons_flutter.dart';
import 'package:store_app/model/product_model.dart';

// ignore: must_be_immutable
class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.productModel});
  final ProductModel productModel;
  Color color = Colors.black;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, alignment: Alignment.center,
      // fit: StackFit.passthrough,
      // alignment: Alignment.topRight,
      children: [
        Container(
          // padding: const EdgeInsets.all(10),
          // margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              // color: Colors.grey[50],
              // boxShadow: [
              //   BoxShadow(
              //       blurRadius: 50,
              //       offset: Offset(1, 1),
              //       spreadRadius: 20,
              //       color: Colors.grey.withOpacity(.1))
              // ],
              // color: Colors.yellowAccent,
              // shape: BoxShape.rectangle
              ),
          // height: 130,
          // width: 200,
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productModel.title,
                    maxLines: 1,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${widget.productModel.price}\$'),
                      IconButton(
                          color: widget.color,
                          onPressed: () {
                            widget.color = Colors.red;
                            setState(() {});
                          },
                          icon: const Icon(FlutterIcons.heart_box_mco))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          height: 100,
          right: 40,
          bottom: 80,
          child: Image.network(
              width: 90, height: 90, '${widget.productModel.image}'),
        ),
      ],
    );
  }
}
