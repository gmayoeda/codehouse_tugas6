class News {
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  News(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
        author: (map["author"] ?? ""),
        title: map["title"],
        description: map["description"],
        url: map["url"],
        urlToImage: (map["urlToImage"] ?? ""),
        publishedAt: map["publishedAt"],
        content: map["content"]);
  }
}
