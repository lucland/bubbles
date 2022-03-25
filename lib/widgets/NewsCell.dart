import 'package:flutter/cupertino.dart';

class NewsCell extends StatelessWidget {
  final String imageURL, title, description;
  NewsCell(
      {required this.imageURL, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Image.network(imageURL),
          Text(title),
          Text(description)
        ],
      ),
    );
  }
}
