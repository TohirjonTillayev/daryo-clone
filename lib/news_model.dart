// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget NewsInfo(BuildContext context, NewsList Info) {
  return Card(
    color: Colors.blue[50],
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: const [
                  Text("Mahalliy"),
                ],
              ),
              Image.asset(
                Info.imageUrl,
                width: 200.0,
                height: 150.0,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Padding(padding: const EdgeInsets.only(bottom: 50.0)),
                  Text("00:47 | 12 dekabr 2021"),
                  Icon(Icons.remove_red_eye_outlined),
                  Text("456")
                ],
              ),
              Text(
                Info.topic,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(Info.info)
            ],
          ),
        ),
      ],
    ),
  );
}

class NewsList {
  String imageUrl;
  String topic;
  String info;

  NewsList(this.imageUrl, this.topic, this.info);

  static List list = [
    NewsList(
        "assets/foto1.jpg",
        "Shavkat Mirziyoyev Dasturiy\n mahsulotlar va axborot texnologiyalari\n texnologik parkini borib ko‘rdi",
        ""),
    NewsList(
        "assets/foto2.jpg",
        "Bayram dasturxoniga ko‘rk bag‘ishlovchi yegulik:\nkivi va pishloqli buterbrod tayyorlaymiz",
        ""),
    NewsList(
        "assets/foto3.jpg",
        "Amsterdamda robot qayiqlarni sinovdan\n o‘tkazish boshlandi — ular kanallar\n bo‘ylab yo‘lovchi tashib, chiqindi yig‘adi ",
        ""),
    NewsList(
        "assets/foto4.jpg",
        "Telegram davlat \nrahbarlari kanallarida \nreklama chiqishni to‘xtatadi ",
        ""),
    NewsList("assets/foto6.jpg", "Immunitetni mustahkamlovchi giyohli choylar ",
        " Tarkibida kofein bo‘lmagani \nsabab ham giyohli choylar \norganizm uchun foydali sanaladi. \nTurli o‘simliklar barcha a’zolar tizimi \nfaoliyatini me’yorlashtirib"),
    NewsList(
        "assets/foto5.jpg",
        " Bundesliga. “Bavariya” \nirodali g‘alabaga erishdi,\n “Borussiya D” so‘nggi daqiqalarda \nbazo‘r mag‘lubiyatdan qutulib qoldi",
        ""),
  ];
}
