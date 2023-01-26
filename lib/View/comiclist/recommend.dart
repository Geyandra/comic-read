import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/View/detail_comic.dart';
import 'package:mini_project_menara_indonesia/Widgets/transitions.dart';
import 'package:provider/provider.dart';

import '../../View-Model/comics.dart';
import '../../View-Model/datacomics.dart';

class RecommendComics extends StatefulWidget {
  const RecommendComics({super.key});

  @override
  State<RecommendComics> createState() => _RecommendComicsState();
}

class _RecommendComicsState extends State<RecommendComics> {
  @override
  Widget build(BuildContext context) {
    final comicsdata = Provider.of<DataComicsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Rekomendasi Komik"),
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
                    onTap: () {
                      final selectcomic =
                          comicsdata.getcomicspopular[index].endpoint;
                      context
                          .read<ComicsProvider>()
                          .setSelectedComic(selectcomic);
                      navPushTransition(context, DetailComic());
                    },
                    child: Column(
                      children: [
                        Image(
                           loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(child: Text("Invalid image data"),);
                                },
                          image: NetworkImage(
                              "${comicsdata.getcomicspopular[index].image}"),
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
