class ComicsModel {
  String? title;
  String? image;
  String? desc;
  String? type;
  String? endpoint;

  ComicsModel({this.title, this.image, this.desc, this.type, this.endpoint});

  ComicsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    desc = json['desc'];
    type = json['type'];
    endpoint = json['endpoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['desc'] = this.desc;
    data['type'] = this.type;
    data['endpoint'] = this.endpoint;
    return data;
  }
}
