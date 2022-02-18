import 'package:flutter/material.dart';

import 'Data/api_client.dart';
import 'Data/articles.dart';
import 'custom_listTile.dart';
import 'krill_lotin.dart';
import 'news_model.dart';
class daryoApp extends StatefulWidget {
  const daryoApp({Key? key}) : super(key: key);

  @override
  _daryoAppState createState() => _daryoAppState();
}

// ignore: camel_case_types
class _daryoAppState extends State<daryoApp> {
  final _apiClient = ApiClient();
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.blueAccent,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Daryo',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                            ),
                          ),
                          selectLang(),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Toshkent',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.cloud,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      height: 20.0,
                      color: Colors.white,
                      thickness: 1.0,
                    ),
                    Expanded(
                        flex: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(" \$ 10769.78",
                                style: TextStyle(color: Colors.white)),
                            Text("€ 12166,62",
                                style: TextStyle(color: Colors.white)),
                            Text("Þ 146.7",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ))
                  ],
                ),
              ),
              Divider(
                thickness: 24,
                color: Colors.yellow[300],
              ),
              Container(
                color: Colors.yellow[300],
                child: const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text("Qo'llanma ekranini ko'rsatish"),
                ),
                height: 30.0,
              ),
              CustomListTile("So'ngi yangiliklar"),
              CustomListTile("Mahalliy"),
              CustomListTile("Dunyo"),
              CustomListTile("Texnologiya"),
              Container(
                height: 40,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.grey)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 8.0),
                  child: Text(
                    "Qo'llanma ekranini ko'rsatish",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              CustomListTile("Madaniyat"),
              CustomListTile("Avto"),
              CustomListTile("Sport"),
              CustomListTile("Foto"),
              CustomListTile("LifeStyle"),
              CustomListTile("Koluminstlar"),
              Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    CustomListTile("Afisha"),
                    CustomListTile("Valyutalar kursi"),
                    CustomListTile("Ob-Havo"),
                    CustomListTile("Foydalanish shartlari"),
                    CustomListTile('"Daryo" haqida'),
                    CustomListTile("Sozlashlar"),
                  ],
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.search),
                )),
          ],
          backgroundColor: Colors.blueAccent[200],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: "So'ngi Yangiliklar",
              ),
              Tab(
                text: "Asosiy Yangiliklar",
              ),
              Tab(
                text: "Eng ko'p Ko'rilganlar",
              ),
            ],
          ),
          title: const Text('Daryo'),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: _apiClient.getFromApi("ru"),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          NewsInfo(article: snapshot.data[index] as Article),
                        ],
                      );
                    },
                  );
                }else {
                  return Container(
                    width: double.infinity,
                    height: 200.0,
                    color: Colors.yellow,
                  );
                }
              },
            ),
            Container(width: 200.0,height: 200.0,color: Colors.red,),
            Container(width: 200.0,height: 200.0,color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}
