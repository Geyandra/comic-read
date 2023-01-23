class SelectedComicModel {
  String? thumbnail;
  String? title;
  String? type;
  String? author;
  String? status;
  String? rating;
  List<String>? genre;
  List<ChapterList>? chapterList;

  SelectedComicModel(
      {this.thumbnail,
      this.title,
      this.type,
      this.author,
      this.status,
      this.rating,
      this.genre,
      this.chapterList});

  SelectedComicModel.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    title = json['title'];
    type = json['type'];
    author = json['author'];
    status = json['status'];
    rating = json['rating'];
    genre = json['genre'].cast<String>();
    if (json['chapter_list'] != null) {
      chapterList = <ChapterList>[];
      json['chapter_list'].forEach((v) {
        chapterList!.add(new ChapterList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    data['title'] = this.title;
    data['type'] = this.type;
    data['author'] = this.author;
    data['status'] = this.status;
    data['rating'] = this.rating;
    data['genre'] = this.genre;
    if (this.chapterList != null) {
      data['chapter_list'] = this.chapterList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChapterList {
  String? name;
  String? endpoint;

  ChapterList({this.name, this.endpoint});

  ChapterList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    endpoint = json['endpoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['endpoint'] = this.endpoint;
    return data;
  }
}
