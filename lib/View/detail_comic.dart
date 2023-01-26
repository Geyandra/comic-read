import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/View/chapterlist.dart';
import 'package:mini_project_menara_indonesia/Widgets/field_data.dart';
import 'package:mini_project_menara_indonesia/Widgets/transitions.dart';
import 'package:provider/provider.dart';

import '../View-Model/comics.dart';
import '../View-Model/enum.dart';

class DetailComic extends StatefulWidget {
  const DetailComic({super.key});

  @override
  State<DetailComic> createState() => DetailComicState();
}

class DetailComicState extends State<DetailComic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ComicsProvider>(builder: (context, value, child) {
        switch (value.state) {
          case ViewState.loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ViewState.none:
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 220,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image(
                      image: NetworkImage("${value.getselectcomic!.thumbnail}"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      FieldData(
                        label: "Title",
                        hintext: "${value.getselectcomic!.title}",
                        maxlines: 3,
                      ),
                      FieldData(
                          label: "Type",
                          hintext: "${value.getselectcomic!.type}"),
                      FieldData(
                          label: "Author",
                          hintext: "${value.getselectcomic!.author}"),
                      FieldData(
                          label: "Status",
                          hintext: "${value.getselectcomic!.status}"),
                      FieldData(
                          label: "Rating",
                          hintext: "${value.getselectcomic!.rating}"),
                      FieldData(
                        label: "Genre",
                        hintext: "${value.genre}",
                        maxlines: 3,
                      ),
                      ElevatedButton(onPressed: (){
                        context.read<ComicsProvider>().setChapter(value.getselectcomic!.chapterList);
                        navPushTransition(context, ChapterPage());
                      }, child: Text("ChapterList"))
                    ],
                  ),
                ),
              ],
            );
          default:
            return Container();
        }
      }),
    );
  }
}
