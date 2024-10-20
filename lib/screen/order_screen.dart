import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/model/order_model.dart';
import 'package:shop_app/state/order_state_notifier.dart';
import 'package:shop_app/widget/drawer.dart';
import 'package:shop_app/widget/order_item_widget.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(orderProvider);
    ref.read(orderProvider.notifier);
    bool visible = false;
    int getindex = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final orderdata = orders[index];
              return order_item_widget(orderdata: orderdata);
            },
          ),
        ],
      ),
    );
  }
}
