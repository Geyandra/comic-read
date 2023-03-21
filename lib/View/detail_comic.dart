import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/Widgets/field_data.dart';
import 'package:mini_project_menara_indonesia/Widgets/navbar.dart';
import 'package:mini_project_menara_indonesia/Widgets/transitions.dart';
import 'package:provider/provider.dart';

import '../View-Model/comics.dart';
import '../View-Model/enum.dart';
import 'chapter_read.dart';

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
                  leading: IconButton(
                      onPressed: () {
                        navPushTransition(context, NavBar());
                      },
                      icon: Icon(Icons.arrow_back_rounded)),
                  automaticallyImplyLeading: false,
                  expandedHeight: 220,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image(
                      image: NetworkImage("${value.getselectcomic!.thumbnail}"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(tabs: [
                            Text("Details"),
                            Text("Chapter"),
                          ]),
                          Expanded(
                              child: TabBarView(children: [
                            Column(
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
                              ],
                            ),
                            ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) => Divider(),
                                itemCount:
                                    value.getselectcomic!.chapterList!.length,
                                itemBuilder: (context, index) {
                                  final chapter =
                                      value.getselectcomic!.chapterList;
                                  return ListTile(
                                    title: Text("${chapter![index].name}"),
                                    onTap: () {
                                      context
                                          .read<ComicsProvider>()
                                          .currentchapter(index);
                                      context
                                          .read<ComicsProvider>()
                                          .setReadChapter(
                                              chapter[index].endpoint);
                                      navPushTransition(context, ChapterRead());
                                    },
                                  );
                                }),
                          ])),
                        ],
                      ),
                    ),
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
