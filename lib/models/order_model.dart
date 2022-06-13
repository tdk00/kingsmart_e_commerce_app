import 'dart:convert';

import 'package:flutter/material.dart';

class OrderModel extends ChangeNotifier{
  final int id, userId;
  String orderNumber, city, address, postal, note, payment, status, createdAt;
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
    required this.status,
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
        status: json['status'],
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
        'status' : status,
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
        productId: int.tryParse( json['productId'] ) ?? 0,
        orderId: int.tryParse( json['orderId'] ) ?? 0,
        price: double.tryParse( json['price'] ) ?? 0,
        oldPrice: double.tryParse( json['oldPrice'] ) ?? 0,
        quantity: int.tryParse( json['quantity'] ) ?? 0,
        name: json['name'],
        image: json['image'],
    );
  }
  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'productId': productId,
        'orderId': orderId,
        'price': price,
        'oldPrice': oldPrice,
        'quantity': quantity,
        'name': name,
        'image': image,
      };

}