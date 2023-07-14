import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class FeedItem {
  final String imageUrl;
  final String description;

  FeedItem({required this.imageUrl, required this.description});
}

class _FeedScreenState extends State<FeedScreen> {
  List<FeedItem> images = [];

  Future<void> fetchImages() async {
    int randomNumber = Random().nextInt(100);
    String accessKey = '9CgESIZMKZl7BKnTGjTroU-2uI2cv0TDAkaIq6i3QXU';
    String apiUrl =
        'https://api.unsplash.com/photos/random?count=10&client_id=$accessKey';

    http.Response response = await http.get(Uri.parse(apiUrl));
    print(response.body);
    print("********");
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<FeedItem> fetchedItems = [];
      for (var item in data) {
        String imageUrl = item['urls']['regular'];
        String description = item['description'] ?? 'No description available';
        fetchedItems
            .add(FeedItem(imageUrl: imageUrl, description: description));
      }

      setState(() {
        images = fetchedItems;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  Future<void> refreshFeed() async {
    await fetchImages();
  }

  Widget ListBuilder() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                images[index].description,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Image.network(
              images[index].imageUrl,
              height: height * 0.3,
              width: width * 0.8,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {
                    // Handle like button press
                  },
                ),
                IconButton(
                  icon: Icon(Icons.comment),
                  onPressed: () {
                    // Handle comment button press
                  },
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    // Handle share button press
                  },
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
          ]),
        );
        // title:
      },
    );
  }

  Widget upperCont() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.26,
      width: width * 1.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(55, 124, 172, 67),
          Color.fromRGBO(11, 73, 110, 43),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Text(
              "Hello",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              "Ayush",
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Center(
              child: Container(
                width: width * 0.6,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feeds'),
      ),
      body: RefreshIndicator(
        onRefresh: refreshFeed,
        child: Column(
          children: [
            upperCont(),
            Expanded(child: ListBuilder()),
          ],
        ),
      ),
    );
  }
}
