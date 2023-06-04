import 'package:flutter/material.dart';
import 'package:news_apps/features/news_features/data/news_repo.dart';
import 'package:news_apps/features/news_features/models/news_model.dart';

class NewsHomeScreen extends StatefulWidget {
  const NewsHomeScreen({Key? key}) : super(key: key);

  @override
  State<NewsHomeScreen> createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
  List<NewsModels> AllNews = [];

  bool loading = true;

  Future dataload() async {
    ApiService service = ApiService();
    var list = await service.getAllNews();
    list.forEach((element) {
      AllNews.add(element);
    });
    setState(() {
      loading = false;
    });
  }

  void initState() {
    dataload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(AllNews.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("News Application"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: loading == false
              ? ListView.builder(
                  itemCount: 100,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    return ListTile(
                      title: Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.blueGrey,
                        child: Text(AllNews[index].description!),
                      ),
                      subtitle: Container(
                        height: 20,
                        width: double.infinity,
                        color: Colors.black,
                      ),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
