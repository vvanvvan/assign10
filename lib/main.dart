///import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'comment.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 22.0,
            //fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<MyLoveWan> MyloveList = [
    MyLoveWan(
        user_img: 'profile_pic1',
        user_post: 'Baekhyunee_EXO',
        post_detail:
            '앞으로 보여질 저 백현이의 많은 모습들을\n 기대해주시고 사랑해주세요!^^\n Please look forward to my varieties\n and activities of Baekhyun.\n I need your love!',
        img_post: 'baekhyunee_img',
        cm_text: [
          UserComment(
              user_comment: 'wanwan:', detail_comment: 'I always love you.<3')
        ]),
    MyLoveWan(
        user_img: 'profile_pic2',
        user_post: 'MyVitamin_B',
        post_detail: 'Doing the thing you love<3.',
        img_post: 'myvitaminb_img',
        cm_text: [
          UserComment(user_comment: 'Baekhyunee_EXO:', detail_comment: '<3')
        ]),
    MyLoveWan(
        user_img: 'profile_pic3',
        user_post: 'wwwwanbbh',
        post_detail: 'Together with you is my favorite place to be.',
        img_post: 'wan_img',
        cm_text: [
          UserComment(user_comment: 'Gai:', detail_comment: 'น่ารักจังอะวั่น'),
          UserComment(user_comment: 'Bo:', detail_comment: 'น่ารักจังวั่น'),
          UserComment(user_comment: 'Moi:', detail_comment: 'คาวาอี้'),
          UserComment(
              user_comment: 'Hmu:', detail_comment: 'ว่านนนนน่าร้ากอ้า'),
          UserComment(
              user_comment: 'Fern Bad:',
              detail_comment: 'มือสวยกว่าหน้ากุอีกอ่ะ')
        ]),
    MyLoveWan(
        user_img: 'profile_pic4',
        user_post: 'WeareoneEXO',
        post_detail:
            "We all were honored for fans to give us the big awards here,\n MAMA last year, and again,\n thank you sincerely for giving us\n the biggest awards this year.\n First of all, Manager brothers, and our lovers, members and our parents.\n Our EXO is fans all around the globe,\n I heartily thank you. Every time we received the big awards,\n I couldn't be merely happy.\n Because I thought we didn't deserve those and many thoughts came up to us.\n Now, this moment, 11 o'clock 43 minutes 34 second, Friday November 22nd, 2013.\n I will never forget, enjoying this very moment and try our best all the time.\n Thanks and love you. Let's love, EXO.",
        img_post: 'exo_img',
        cm_text: [
          UserComment(
              user_comment: 'wanwan:',
              detail_comment: 'I always love you, we are one.<3')
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MY LOVE IS: ')),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_anime.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
            itemCount: MyloveList.length,
            itemBuilder: (context, index) =>
                MyCard(listPost: MyloveList[index])),

        ///backgroundColor: Color.fromRGBO(90, 107, 206, 100.0),
      ),
    );
  }
}

class MyCard extends StatefulWidget {
  final MyLoveWan listPost;

  MyCard({
    Key? key,
    required this.listPost,
    ////required this.Mylove_post,
  }) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardstate();
}

class _MyCardstate extends State<MyCard> {
  var result = '';
  bool addFavorit = false;
  final TextEditingController _textEdit = new TextEditingController();

  String allComment() {
    for (var i = 0; i < widget.listPost.cm_text.length; i++) {
      result += widget.listPost.cm_text[i].user_comment +
          ' ' +
          widget.listPost.cm_text[i].detail_comment +
          '\n';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),

        ///elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 17, bottom: 17),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                          'assets/images/${widget.listPost.user_img}.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(widget.listPost.user_post,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                      child: Container(
                    width: 50,
                  )),
                  IconButton(
                    iconSize: 25,
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ////SizedBox(height: 50.0),

                  ///padding: const EdgeInsets.symmetric(vertical: 50.0),
                  Expanded(
                    child: Image.asset(
                      'assets/images/${widget.listPost.img_post}.jpg',
                      width: 100.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Expanded(
                        child: Text(
                            '${widget.listPost.user_post} : ${widget.listPost.post_detail}',
                            overflow: TextOverflow.ellipsis)),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Expanded(
                        child: Text(allComment(),
                            overflow: TextOverflow.ellipsis)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _textEdit,
                    textAlign: TextAlign.start,
                    decoration: new InputDecoration(
                      prefixIcon: IconButton(
                          icon: Icon(addFavorit ? Icons.favorite : Icons.favorite_border),
                          onPressed: () {
                            setState(() {
                              addFavorit = !addFavorit;
                            });
                          }),
                      hintText: "Add a comment",
                    ),
                    onSubmitted: (String str) {
                      setState(() {
                        widget.listPost.addComment('Your Love: ', str);
                        _textEdit.clear();
                      });
                  }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



