import 'package:flutter/material.dart';

class CartData {
  final String dressName, dressColor, dressSize, dressImage;
  int dressPrice, quantity;

  CartData({
    required this.dressName,
    required this.dressColor,
    required this.dressSize,
    required this.dressImage,
    required this.dressPrice,
    required this.quantity,
  });
}

List<CartData> info = [
  CartData(
    dressName: "Pullover",
    dressColor: "Black",
    dressSize: "L",
    dressPrice: 51,
    dressImage: "assets/images/pullover.png",
    quantity: 1,
  ),
  CartData(
    dressName: "T-Shirt",
    dressColor: "Grey",
    dressSize: "L",
    dressPrice: 30,
    dressImage: "assets/images/tShirt.png",
    quantity: 1,
  ),
  CartData(
    dressName: "Sport Dress",
    dressColor: "Black",
    dressSize: "M",
    dressPrice: 43,
    dressImage: "assets/images/sport.png",
    quantity: 1,
  )
];
