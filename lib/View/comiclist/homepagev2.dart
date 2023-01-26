import 'package:flutter/material.dart';
import 'package:mini_project_menara_indonesia/View-Model/datacomics.dart';
import 'package:provider/provider.dart';

import '../../Widgets/image_network.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataprovider =
        Provider.of<DataComicsProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Homepage v2"),
          bottom: TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.blue.shade200,
              labelStyle: TextStyle(fontSize: 14),
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Home",
                ),
                Tab(
                  text: "Manga",
                ),
                Tab(
                  text: "Manhwa",
                ),
                Tab(
                  text: "Manhua",
                ),
              ]),
        ),
        body: FutureBuilder(
            future: dataprovider.setAllComic(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 220,
                    width: double.maxFinite,
                    child: TabBarView(controller: _tabController, children: [
                      //homepage
                      ListView.separated(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Card(
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: ShowImageNetwork(
                                        urlimage:
                                            "${dataprovider.getlist[index].image}",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                          "${dataprovider.getlist[index].title}"),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: dataprovider.getlist.length),

                      //manga
                      ListView.separated(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Card(
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: ShowImageNetwork(
                                        urlimage:
                                            "${dataprovider.getfiltermanga[index].image}",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                          "${dataprovider.getfiltermanga[index].title}"),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: dataprovider.getfiltermanga.length),

                      //manhwa
                      ListView.separated(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Card(
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: ShowImageNetwork(
                                        urlimage:
                                            "${dataprovider.getfiltermanhwa[index].image}",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                          "${dataprovider.getfiltermanhwa[index].title}"),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: dataprovider.getfiltermanga.length),

                      //manhua
                      ListView.separated(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Card(
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: ShowImageNetwork(
                                        urlimage:
                                            "${dataprovider.getfiltermanhua[index].image}",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                          "${dataprovider.getfiltermanhua[index].title}"),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: dataprovider.getfiltermanga.length),
                    ]),
                  )
                ],
              );
            }));
  }
}
