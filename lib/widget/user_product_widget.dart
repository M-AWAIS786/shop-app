import 'package:flutter/material.dart';

class user_product_widget extends StatelessWidget {
  const user_product_widget({
    super.key,
    required this.title,
    required this.imageurl,
  });
  final String title;
  final String imageurl;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageurl),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
