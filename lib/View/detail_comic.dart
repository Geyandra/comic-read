import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/View-Model/comics.dart';
import 'package:mini_project_menara_indonesia/Widgets/field_data.dart';
import 'package:provider/provider.dart';

class DetailComic extends StatefulWidget {
  const DetailComic({super.key});

  @override
  State<DetailComic> createState() => DetailComicState();
}

class DetailComicState extends State<DetailComic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            flexibleSpace:
                Consumer<ComicsProvider>(builder: (context, value, child) {
              return FlexibleSpaceBar(
                background: Image(
                  image: NetworkImage("${value.getcomic!.thumbnail}"),
                  fit: BoxFit.fitHeight,
                ),
              );
            }),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Consumer<ComicsProvider>(
                  builder: (context, value, child) {
                    return FieldData(
                        label: "Title", hintext: "${value.getcomic!.title}");
                  },
                ),
                Consumer<ComicsProvider>(
                  builder: (context, value, child) {
                    return FieldData(
                        label: "Type", hintext: "${value.getcomic!.type}");
                  },
                ),
                Consumer<ComicsProvider>(
                  builder: (context, value, child) {
                    return FieldData(
                        label: "Author", hintext: "${value.getcomic!.author}");
                  },
                ),
                Consumer<ComicsProvider>(
                  builder: (context, value, child) {
                    return FieldData(
                        label: "Status", hintext: "${value.getcomic!.status}");
                  },
                ),
                Consumer<ComicsProvider>(
                  builder: (context, value, child) {
                    return FieldData(
                        label: "Rating", hintext: "${value.getcomic!.rating}");
                  },
                ),
                Consumer<ComicsProvider>(
                  builder: (context, value, child) {
                    return FieldData(
                        label: "Genre", hintext: "${value.getcomic!.genre}");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
