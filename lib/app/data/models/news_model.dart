class NewsModel {
  String? postId;

  String? imageUrl;
  String? title;
  String? description;
  String? credits;
  String? publishedAt;
  String? views;

  NewsModel(
      {this.credits,
      this.description,
      this.imageUrl,
      this.postId,
      this.publishedAt,
      this.title,
      this.views});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      imageUrl: json["imageUrl"],
      title: json["title"],
      description: json["description"],
      credits: json["credits"],
      publishedAt: json["publishedAt"],
      views: json["views"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "imageUrl": imageUrl,
      "title": title,
      "description": description,
      "credits": credits,
      "publishedAt": publishedAt,
      "views": views,
    };
  }
}
