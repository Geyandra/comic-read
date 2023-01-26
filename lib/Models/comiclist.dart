class ComicListModel {
  String? title;
  String? image;
  String? endpoint;

  ComicListModel({this.title, this.image, this.endpoint});

  ComicListModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    endpoint = json['endpoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['endpoint'] = this.endpoint;
    return data;
  }
}
