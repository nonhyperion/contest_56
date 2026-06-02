class News {
  final String id;
  final String category;
  final String title;
  final String date;
  final String summary;
  final String content;
  final List<String> tags;
  final String image;
  final bool isFeatured;

  const News(
    this.id,
    this.category,
    this.title,
    this.date,
    this.summary,
    this.content,
    this.tags,
    this.image,
    this.isFeatured,
  );

  static News FromJson(Map<String, dynamic> map) {
    List<String> tags = (map["tags"] as List<dynamic>)
        .map((i) => i.toString())
        .toList();
    return News(
      map["id"],
      map["category"],
      map["title"],
      map["date"],
      map["summary"],
      map["content"],
      tags,
      map["image"],
      map["isFeatured"],
    );
  }
}
