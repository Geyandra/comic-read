import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/View-Model/datacomics.dart';
import 'package:provider/provider.dart';

import '../../View-Model/comics.dart';
import '../../Widgets/transitions.dart';
import '../detail_comic.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final dataprovider =
        Provider.of<DataComicsProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Homepage"),
        ),
        body: FutureBuilder(
          future: dataprovider.setAllComic(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      final selectcomic = dataprovider.getlist[index].endpoint;
                      context.read<ComicsProvider>().setSelectedComic(selectcomic);
                      navPushTransition(context, DetailComic());
                    },
                    child: Card(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image(
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
                                        "${dataprovider.getlist[index].image}")),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                width: MediaQuery.of(context).size.width,
                                child:
                                    Text("${dataprovider.getlist[index].title}"),
                              )
                            ],
                          ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: dataprovider.getlist.length);
          },
        ));
  }
}
