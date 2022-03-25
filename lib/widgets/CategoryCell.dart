import 'package:flutter/material.dart';

class CategoryCell extends StatelessWidget {
  final imageURL, categoryName;
  const CategoryCell({this.imageURL, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/category', arguments: categoryName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          children: [
            Image.network(
              imageURL,
              height: 60,
              width: 120,
              fit: BoxFit.cover,
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  categoryName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
