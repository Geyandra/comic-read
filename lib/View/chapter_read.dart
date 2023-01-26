import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/View-Model/comics.dart';
import 'package:provider/provider.dart';

import '../View-Model/enum.dart';

class ChapterRead extends StatelessWidget {
  const ChapterRead({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    return Image(
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text("Invalid image data"),
                        );
                      },
                      image: NetworkImage(value.getchapter.image![index]),
                    );
                  });
            default:
              return Container();
          }
        },
      ),
    );
  }
}