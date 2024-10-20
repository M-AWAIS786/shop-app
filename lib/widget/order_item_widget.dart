import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/model/order_model.dart';

class order_item_widget extends StatefulWidget {
  const order_item_widget({
    super.key,
    required this.orderdata,
  });

  final Order orderdata;

  @override
  State<order_item_widget> createState() => _order_item_widgetState();
}

class _order_item_widgetState extends State<order_item_widget> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.orderdata.amount.toString()),
          subtitle: Text(DateFormat.yMEd().format(widget.orderdata.dateTime)),
          trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more)),
        ),
        if (_expanded)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            // color: Colors.grey,
            height: min(widget.orderdata.products.length * 20.0 + 10, 180),
            child: ListView(
              shrinkWrap: true,
              children: widget.orderdata.products
                  .map((prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            prod.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${prod.quantity}x \$${prod.price}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),
          )
      ],
    );
  }
}
