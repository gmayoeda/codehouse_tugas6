import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/home_controller.dart';
import 'custom/loading.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController x;

  @override
  Widget build(BuildContext context) {
    x = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/Ellipse.png"),
          ),
        ),
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Obx(() => Text(
              'Hi ${x.name.value.toUpperCase()} !',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => x.list_news.isEmpty
            ? Loading()
            : ListView.builder(
                itemCount: x.list_news.length,
                itemBuilder: (context, index) {
                  final news = x.list_news[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 0.5, color: Colors.grey.withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5.0,
                          offset: Offset(0.0, 2.0),
                        ),
                      ],
                    ),
                    child: Column(children: [
                      Text(
                        // news.author,
                        news.author,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8),
                      Text(
                        news.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 5),
                      Text(news.description),
                      SizedBox(height: 5),
                      InkWell(
                        onTap: () => x.link(news.url),
                        child: news.urlToImage.isEmpty
                            ? Loading()
                            : Image.network(news.urlToImage),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'click image for more detail',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 10,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        news.publishedAt,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 8),
                      Text(news.content),
                    ]),
                  );
                })),
      ),
    );
  }
}
