import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/Models/selectedcomic.dart';
import '../Models/comics.dart';

class ComicsProvider with ChangeNotifier {
  final dio = Dio();
  String url = "https://komiku-api.fly.dev/api/comic";
  List<ComicsModel> _comicspopular = [];
  List<ComicsModel> _comicsrecommend = [];
  SelectedComicModel? getcomic;

  List<ComicsModel> get getcomicspopular => _comicspopular;
  List<ComicsModel> get getcomicsrecommend => _comicsrecommend;

  Future<void> setAllpopularcomic() async {
    var res = await dio.get("$url/popular/page/1");
    if (res.statusCode == 200) {
      final List comic = res.data["data"];
      _comicspopular = comic.map((e) => ComicsModel.fromJson(e)).toList();
    }
    notifyListeners();
  }

    Future<void> setAllrecommendcomic() async {
    var res = await dio.get("$url/recommended/page/1");
    if (res.statusCode == 200) {
      final List comic = res.data["data"];
      _comicsrecommend = comic.map((e) => ComicsModel.fromJson(e)).toList();
    }
    notifyListeners();
  }

 selectedcomic(selectcomic)async{
    var res = await dio.get("$url/info$selectcomic");
      final comic = res.data["data"];
      print(comic);
      getcomic = SelectedComicModel.fromJson(comic);
    notifyListeners();
  }
}