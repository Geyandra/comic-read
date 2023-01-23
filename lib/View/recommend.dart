import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/View/detail_comic.dart';
import 'package:mini_project_menara_indonesia/Widgets/transitions.dart';
import 'package:provider/provider.dart';

import '../View-Model/comics.dart';

class RecommendComics extends StatefulWidget {
  const RecommendComics({super.key});

  @override
  State<RecommendComics> createState() => _RecommendComicsState();
}

class _RecommendComicsState extends State<RecommendComics> {
  @override
  Widget build(BuildContext context) {
    final comicsdata = Provider.of<ComicsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Komik Popular"),
      ),
      body: FutureBuilder(
        future: comicsdata.setAllrecommendcomic(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) => InkWell(
                    onLongPress: () {
                      final selectcomic =
                          comicsdata.getcomicspopular[index].endpoint;
                      context.read<ComicsProvider>().selectedcomic(selectcomic);
                      navPushTransition(context, DetailComic());
                    },
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${comicsdata.getcomicsrecommend[index].image}"),
                                  fit: BoxFit.fitWidth)),
                        ),
                        ListTile(
                          title: Text(
                              "${comicsdata.getcomicsrecommend[index].title}"),
                          subtitle: Text(
                              "${comicsdata.getcomicsrecommend[index].desc}"),
                          trailing: Text(
                              "${comicsdata.getcomicsrecommend[index].type}"),
                        ),
                      ],
                    ),
                  ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: comicsdata.getcomicsrecommend.length);
        },
      ),
    );
  }
}
