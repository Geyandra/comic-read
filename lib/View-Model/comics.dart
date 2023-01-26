import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Models/chapter_read.dart';
import '../Models/selectedcomic.dart';
import 'enum.dart';

class ComicsProvider with ChangeNotifier {
  final dio = Dio();
  String url = "https://komiku-api.fly.dev/api/comic";

  ViewState _state = ViewState.none;
  String? genre = '';
  SelectedComicModel? _selectcomic;
  List<ChapterList> datachapter = [];
  late ChapterReadModel _selectchapter;

  ViewState get state => _state;
  SelectedComicModel? get getselectcomic => _selectcomic;
  ChapterReadModel get getchapter => _selectchapter;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  setSelectedComic(selectcomic) async {
    setState(ViewState.loading);
    try {
      var res = await dio.get("$url/info$selectcomic");
      if (res.statusCode == 200) {
        final comic = res.data["data"];
        _selectcomic = SelectedComicModel.fromJson(comic);
        List<String>? datagenre = _selectcomic!.genre;
        genre = datagenre!.join(", ");
        setState(ViewState.none);
      }
    } catch (e) {
      setState(ViewState.error);
    }
    notifyListeners();
  }

  setChapter(chapterlist) {
    datachapter = chapterlist;
    notifyListeners();
  }

  Future<void> setReadChapter(chapter) async {
    setState(ViewState.loading);
    try {
      var res = await dio.get("$url/chapter$chapter");
      if (res.statusCode == 200) {
        final chapter = res.data["data"];
        _selectchapter = ChapterReadModel.fromJson(chapter);
        setState(ViewState.none);
      }
    } catch (e) {
      setState(ViewState.error);
    }
    notifyListeners();
  }
}
