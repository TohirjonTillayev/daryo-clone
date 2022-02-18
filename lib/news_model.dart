import 'package:intl/intl.dart';
import 'package:daryo_clone/Data/articles.dart';
import 'package:flutter/material.dart';

class NewsInfo extends StatelessWidget {
  final Article article;
  const NewsInfo({Key? key , required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateParsed = DateTime.tryParse(article.publishedAt);
    dateParsed = dateParsed ?? DateTime.now();
    String publishDate =
    DateFormat('dd-mm, yyyy').format(dateParsed).toString();
    String publishTime = DateFormat('hh:mm').format(dateParsed).toString();

    return  Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(article.source.name),
                Row(
                  children: [
                    Text(
                      '$publishDate | $publishTime',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.blue,
                    ),
                    Text(
                      "456",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Row(
              children: [
               Image.network(article.urlToImage ?? article.defaultImageLink,
               width: 200.0,
               height: 100.0,),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Text(
                    article.title,
                    semanticsLabel: article.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
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
        "Bayram dasturxoniga ko‘rk\n bag‘ishlovchi yegulik:\nkivi va pishloqli buterbrod tayyorlaymiz",
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
