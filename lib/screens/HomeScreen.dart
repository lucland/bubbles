import 'package:bubbles/helper/CategoriesData.dart';
import 'package:bubbles/helper/NewsData.dart';
import 'package:bubbles/models/CategoryModel.dart';
import 'package:bubbles/models/NewsModel.dart';
import 'package:bubbles/widgets/CategoryCell.dart';
import 'package:bubbles/widgets/NewsCell.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<NewsModel>? news = [];
  NewsData newsData = NewsData();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement activate
    super.initState();
    categories = getCategoriesData();
  }

  void getNewsData() async {
    await newsData.getNews().then((List<NewsModel>? value) {
      setState(() {
        news = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            //TODO: add menu button here
            Text(
              "Bubbles",
              style: TextStyle(
                  color: Colors.pinkAccent, fontWeight: FontWeight.w600),
            ),
            //TODO: add category name
            Text(
              " | Technology",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            height: 70.0,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryCell(
                    categoryName: categories[index].categoryName,
                    imageURL: categories[index].imageURL,
                  );
                }),
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: news?.length,
                      itemBuilder: (context, index) {
                        return NewsCell(
                          title: news![index].title!,
                          imageURL: news![index].urlToImage!,
                          description: news![index].description!,
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
