// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';

class ProductModel {
  dynamic id;
  String title;
  dynamic price;
  String description;
  String category;
  String image;
  RatingModel? ratingModel;
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    @required this.ratingModel,
  });
  factory ProductModel.fromJson(JsonData) {
    return ProductModel(
      id: JsonData['id'],
      title: JsonData['title'],
      description: JsonData['description'],
      price: JsonData['price'],
      category: JsonData['category'],
      image: JsonData['image'],
      ratingModel: JsonData['rating'] == null
          ? null
          : RatingModel.fromJson(JsonData['rating']),
    );
  }
}

class RatingModel {
  dynamic rate;
  dynamic count;
  RatingModel({
    this.rate,
    this.count,
  });
  factory RatingModel.fromJson(JsonData) {
    return RatingModel(rate: JsonData['rate'], count: JsonData['count']);
  }
}
