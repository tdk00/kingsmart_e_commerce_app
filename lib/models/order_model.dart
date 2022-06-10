import 'dart:convert';

import 'package:flutter/material.dart';

class OrderModel extends ChangeNotifier{
  final int id, userId;
  String orderNumber, city, address, postal, note, payment, createdAt;
  double total;
  List<OrderItemModel> items;
  OrderModel( {
    required this.id,
    required this.userId,
    required this.orderNumber,
    required this.city,
    required this.address,
    required this.postal,
    required this.note,
    required this.payment,
    required this.total,
    required this.items,
    required this.createdAt, } );


  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        id: int.tryParse( json['id'] ) ?? 0,
        userId: int.tryParse( json['userId'] ) ?? 0,
        orderNumber: json['orderNumber'],
        city: json['city'],
        address: json['address'],
        postal: json['postal'],
        note: json['note'],
        payment: json['payment'],
        total: double.tryParse( json['total'] ) ?? 0,
        items: [],
        createdAt: json['createdAt']
    );
  }
  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'userId': userId,
        'orderNumber': orderNumber,
        'city': city,
        'address': address,
        'postal': postal,
        'note': note,
        'payment': payment,
        'total': total,
        'items' : items,
        'createdAt': createdAt,
      };

}

class OrderItemModel extends ChangeNotifier{
  final String name, image;
  final int id, productId, orderId, quantity;
  double price, oldPrice;
  OrderItemModel( {
    required this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.orderId,
    required this.quantity,
    required this.price,
    required this.oldPrice } );


  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
        id: int.tryParse( json['id'] ) ?? 0,
        productId: json['productId'],
        name: json['name'],
        image: json['image'],
        orderId: json['orderId'],
        quantity: json['quantity'],
        price: json['price'],
        oldPrice: json['oldPrice']
    );
  }
  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'productId': productId,
        'name': name,
        'image': image,
        'orderId': orderId,
        'quantity': quantity,
        'price': price,
        'oldPrice': oldPrice
      };

}