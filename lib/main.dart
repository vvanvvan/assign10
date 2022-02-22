import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'covid_model.dart';

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
            '앞으로 보여질 저 백현이의 많은 모습들을 기대해주시고 사랑해주세요!^^ Please look forward to my varieties and activities of Baekhyun. I need your love!',
        img_post: 'baekhyunee_img'),
    MyLoveWan(
        user_img: 'profile_pic2',
        user_post: 'MyVitamin_B',
        post_detail: 'Doing the thing you love<3.',
        img_post: 'myvitaminb_img'),
    MyLoveWan(
        user_img: 'profile_pic3',
        user_post: 'wwwwanbbh',
        post_detail: 'Together with you is my favorite place to be.',
        img_post: 'wan_img'),
    MyLoveWan(
        user_img: 'profile_pic4',
        user_post: 'WeareoneEXO',
        post_detail:
            "We all were honored for fans to give us the big awards here, MAMA last year, and again, thank you sincerely for giving us the biggest awards this year. First of all, Teacher Lee SooMan, SM TOWN family, manager brothers, and our lovers, members and our parents. Our EXO is fans all around the globe, I heartily thank you. Every time we received the big awards, I couldn't be merely happy. Because I thought we didn't deserve those and many thoughts came up to us. Now, this moment, 11 o'clock 43 minutes 34 second, Friday November 22nd, 2013. I will never forget, enjoying this very moment and try our best all the time. Thanks and love you. Let's love, EXO.",
        img_post: 'exo_img'),
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
                MyCard(Mylove_post: MyloveList[index])),

        ///backgroundColor: Color.fromRGBO(90, 107, 206, 100.0),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final MyLoveWan Mylove_post;

  const MyCard({
    Key? key,
    required this.Mylove_post,
  }) : super(key: key);

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
                          'assets/images/${Mylove_post.user_img}.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(Mylove_post.user_post,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
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
                      'assets/images/${Mylove_post.img_post}.jpg',
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
                            '${Mylove_post.user_post} : ${Mylove_post.post_detail}',
                            overflow: TextOverflow.ellipsis)),
                  ),
                ],
              ),
              IconButton(
                iconSize: 15,
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Add a comment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key) {}

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _input = '';
  var _feedbackText = 'ทายเลข 1 ถึง 100';

  void _showOkDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY LOVE IS: '),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.shade100,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/guess_logo.png', width: 90.0),
                    SizedBox(width: 8.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('GUESS',
                            style: TextStyle(
                                fontSize: 36.0, color: Colors.purple.shade200)),
                        Text(
                          'THE NUMBER',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.purple.shade600,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(_input, style: TextStyle(fontSize: 50.0)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(_feedbackText, style: TextStyle(fontSize: 20.0)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 1; i <= 3; i++) _buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 4; i <= 6; i++) _buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 7; i <= 9; i++) _buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(num: -2),
                  _buildButton(num: 0),
                  _buildButton(num: -1),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: Text('GUESS'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({int? num}) {
    Widget child = Text('$num', style: TextStyle(fontSize: 20.0));
    if (num == -2) {
      child = Icon(Icons.close);
    } else if (num == -1) {
      child = Icon(Icons.backspace_outlined);
    }

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            if (num == -2) {
              setState(() {
                _input = '';
              });
            } else if (num == -1) {
              if (_input.length > 0) {
                setState(() {
                  _input = _input.substring(0, _input.length - 1);
                });
              }
            } else {
              if (_input.length >= 3) return;

              setState(() {
                _input = '$_input$num';
              });
            }
          });
        },
        child: child,
      ),
    );
  }
}
