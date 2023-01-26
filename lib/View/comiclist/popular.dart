import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/View-Model/datacomics.dart';
import 'package:provider/provider.dart';

import '../../View-Model/comics.dart';
import '../../Widgets/transitions.dart';
import '../detail_comic.dart';

class PopularComics extends StatefulWidget {
  const PopularComics({super.key});

  @override
  State<PopularComics> createState() => _PopularComicsState();
}

class _PopularComicsState extends State<PopularComics> {
  @override
  Widget build(BuildContext context) {
    final comicsdata = Provider.of<DataComicsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Komik Popular"),
      ),
      body: FutureBuilder(
        future: comicsdata.setAllpopularcomic(),
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
                              "${comicsdata.getcomicspopular[index].title}"),
                          subtitle: Text(
                              "${comicsdata.getcomicspopular[index].desc}"),
                          trailing: Text(
                              "${comicsdata.getcomicspopular[index].type}"),
                        ),
                      ],
                    ),
                  ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: comicsdata.getcomicspopular.length);
        },
      ),
    );
  }
}
