import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/Models/comiclist.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../Models/comics.dart';
import 'enum.dart';

class DataComicsProvider with ChangeNotifier {
  int page = 1;
  final dio = Dio();
  String url = "https://komiku-api.fly.dev/api/comic";
  List<ComicsModel> _comicspopular = [];
  List<ComicsModel> _comicsrecommend = [];
  ViewState _state = ViewState.none;
  List<ComicListModel> _list = [];
  List<ComicListModel> _filtermanga = [];
  List<ComicListModel> _filtermanhwa = [];
  List<ComicListModel> _filtermanhua = [];

  List<ComicsModel> get getcomicspopular => _comicspopular;
  List<ComicsModel> get getcomicsrecommend => _comicsrecommend;
  List<ComicListModel> get getlist => _list;
  List<ComicListModel> get getfiltermanga => _filtermanga;
  List<ComicListModel> get getfiltermanhwa => _filtermanhwa;
  List<ComicListModel> get getfiltermanhua => _filtermanhua;
  ViewState get state => _state;

  RefreshController _refreshController = RefreshController();
  RefreshController get refreshcontroller => _refreshController;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  //popular comic
  Future<void> setAllpopularcomic() async {
    try {
      var res = await dio.get("$url/popular/page/$page");
      if (res.statusCode == 200) {
        final List comic = res.data["data"];
        _comicspopular = comic.map((e) => ComicsModel.fromJson(e)).toList();
      }
      _refreshController.refreshCompleted();
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  //recommend comic
  Future<void> setAllrecommendcomic() async {
    var res = await dio.get("$url/recommended/page/$page");
    try {
      if (res.statusCode == 200) {
        final List comic = res.data["data"];
        _comicsrecommend = comic.map((e) => ComicsModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

    //all comic list
    Future<void> setAllComic() async {
    var res = await dio.get("$url/list");
    var resmanga = await dio.get("$url/list?filter=manga");
    var resmanhwa = await dio.get("$url/list?filter=manhwa");
    var resmanhua = await dio.get("$url/list?filter=manhua");
    try {
      if (res.statusCode == 200) {
        final List data = res.data["data"];
        _list = data.map((e) => ComicListModel.fromJson(e)).toList();
      }
      if (resmanga.statusCode == 200) {
        final List datamanga = resmanga.data['data'];
        _filtermanga = datamanga.map((e) => ComicListModel.fromJson(e)).toList();
      }
      if (resmanhwa.statusCode == 200) {
        final List datamanhwa = resmanhwa.data['data'];
        _filtermanhwa = datamanhwa.map((e) => ComicListModel.fromJson(e)).toList();
      }
      if (resmanhua.statusCode == 200) {
        final List datamanhua = resmanhua.data['data'];
        _filtermanhua = datamanhua.map((e) => ComicListModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
