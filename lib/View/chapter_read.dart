import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/View-Model/comics.dart';
import 'package:mini_project_menara_indonesia/View/chapterlist.dart';
import 'package:mini_project_menara_indonesia/Widgets/image_network.dart';
import 'package:mini_project_menara_indonesia/Widgets/transitions.dart';
import 'package:provider/provider.dart';

import '../View-Model/enum.dart';

class ChapterRead extends StatelessWidget {
  const ChapterRead({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            height: 45,
            width: 45,
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () {},
              child: Image.asset("assets/images/previous.png"),
            ),
          ),
          Consumer<ComicsProvider>(builder: (context, value, child) {
            return Container(
              padding: EdgeInsets.only(right: 10),
              height: 45,
              width: 45,
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: () {
                },
                child: Image.asset("assets/images/next.png"),
              ),
            );
          }),
        ],
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navReplaceTransition(context, ChapterPage());
            },
            icon: Icon(Icons.arrow_back_rounded)),
        title: Consumer<ComicsProvider>(
          builder: (context, value, child) {
            switch (value.state) {
              case ViewState.loading:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ViewState.none:
                return Text("${value.getchapter.title}");
              default:
                return Container();
            }
          },
        ),
      ),
      body: Consumer<ComicsProvider>(
        builder: (context, value, child) {
          switch (value.state) {
            case ViewState.loading:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ViewState.none:
              return ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                  itemCount: value.getchapter.image!.length,
                  itemBuilder: (context, index) {
                    return ShowImageNetwork(
                        urlimage: value.getchapter.image![index]);
                  });
            default:
              return Container();
          }
        },
      ),
    );
  }
}
