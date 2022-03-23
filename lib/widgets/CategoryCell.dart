import 'package:flutter/material.dart';

class CategoryCell extends StatelessWidget {
  final imageURL, categoryName;
  const CategoryCell({this.imageURL, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(
            imageURL,
            height: 60,
            width: 120,
          ),
        ],
      ),
    );
  }
}
