import 'package:diet/common/pitterConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> images = [
    "assets/logo.png",
    "assets/login-google.png",
    "assets/login-kakao.png",
    "assets/login-naver.png",
    "assets/logo.png",
    "assets/login-google.png",
    "assets/login-kakao.png",
    "assets/login-naver.png",
    "assets/naver_square.png",
    "assets/logo.png",
    "assets/login-google.png",
    "assets/login-kakao.png",
    "assets/login-naver.png",
    "assets/logo.png",
    "assets/login-google.png",
    "assets/login-kakao.png",
    "assets/login-naver.png",
    "assets/naver_square.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryBackGroundColor,
        iconTheme: IconThemeData(color: primaryIconColor),
      ),
        body: Column(
          children: [
            Card(

            ),
            ListView.builder(
              itemBuilder: (BuildContext, index){
                return Container(
                  height: 200,
                  children: [
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage: AssetImage(images[index]),),
                        title: Text("This is title"),
                        subtitle: Text("This is subtitle"),
                      ),
                    ),
                  ],
                );
              },
              itemCount: images.length,
              shrinkWrap: true,
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
            ),
          ],
        ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) => {},
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.flagCheckered),
              label: '랭킹전',
            ),
            BottomNavigationBarItem(
              //icon: Icon(Icons.mail),
              icon: FaIcon(FontAwesomeIcons.userFriends),
              label: '클럽',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user),
              label: '마이페이지',
          )
        ]
      )
    );
  }
}
