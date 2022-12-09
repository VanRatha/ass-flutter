import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ItemOrder extends StatelessWidget {
  final Order OrderModel;

  const ItemOrder({super.key, required this.OrderModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white70,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  OrderModel.image,
                ),
              ),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(0, 3),
                  color: Colors.white,
                )
              ],
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                OrderModel.name,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const Text(
                "2x tuna sahimi, 3x vegetble, 1x noodle",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
              Text(
                "\$ ${OrderModel.price}",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.pink),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
