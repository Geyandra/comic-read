import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/View-Model/comics.dart';
import 'package:mini_project_menara_indonesia/View/detail_comic.dart';
import 'package:mini_project_menara_indonesia/Widgets/image_network.dart';
import 'package:mini_project_menara_indonesia/Widgets/transitions.dart';
import 'package:provider/provider.dart';

import '../View-Model/enum.dart';

class ChapterRead extends StatelessWidget {
  const ChapterRead({super.key});

  @override
  Widget build(BuildContext context) {
    final updatechpater = Provider.of<ComicsProvider>(context, listen: false);
    return Consumer<ComicsProvider>(builder: (context, value, child) {
      switch (value.state) {
        case ViewState.loading:
          return Center(
            child: CircularProgressIndicator(),
          );
        case ViewState.none:
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 45,
                  width: 45,
                  child: FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      updatechpater.decrementchpater();
                      context.read<ComicsProvider>().setReadChapter(
                          "${value.datachapter[value.prev].endpoint}");
                      navPushTransition(context, ChapterRead());
                    },
                    child: Image.asset("assets/images/previous.png"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  height: 45,
                  width: 45,
                  child: FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      updatechpater.incrementchpater();
                      context.read<ComicsProvider>().setReadChapter(
                          "${value.datachapter[value.next].endpoint}");
                      navPushTransition(context, ChapterRead());
                    },
                    child: Image.asset("assets/images/next.png"),
                  ),
                ),
              ],
            ),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () {
                    navPushTransition(context, DetailComic());
                  },
                  icon: Icon(Icons.arrow_back_rounded)),
              title: Text("${value.getchapter.title}"),
            ),
            body: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                itemCount: value.getchapter.image!.length,
                itemBuilder: (context, index) {
                  return ShowImageNetwork(
                      urlimage: value.getchapter.image![index]);
                }),
          );
        default:
          return Container();
      }
    });
  }
}
