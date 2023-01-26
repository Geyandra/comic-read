import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/View/chapter_read.dart';
import 'package:mini_project_menara_indonesia/Widgets/transitions.dart';
import 'package:provider/provider.dart';

import '../View-Model/comics.dart';

class ChapterPage extends StatelessWidget {
  const ChapterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chapter List"),),
      body: Consumer<ComicsProvider>(builder: (context, value, child) {
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: value.datachapter.length,
          itemBuilder: (context, index) => ListTile(title: Text("${value.datachapter[index].name}"),onTap: () {
            context.read<ComicsProvider>().setReadChapter("${value.datachapter[index].endpoint}");
            navPushTransition(context, ChapterRead());
          },),
          );
      },),
    );;
  }
}