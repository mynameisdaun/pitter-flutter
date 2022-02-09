import 'package:diet/common/pitterConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  ScrollController _controller = new ScrollController();
  DateFormat dateFormat = DateFormat("yy-MM-dd HH:mm");


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
        body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext, index){
                    return Container(
                      height: 280,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(color: Colors.lightBlueAccent),
                                    child:
                                    Text(
                                      '아이템',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(color: Colors.redAccent),
                                    child: Text(
                                      'L1이상',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(color: Colors.yellowAccent),
                                    child: Text(
                                      '플래티넘~',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(color: Colors.lightBlueAccent),
                                    child: Text(
                                      '16살~',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(color: Colors.greenAccent),
                                    child: Text(
                                      '음성대화O',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /* 게시글 컨텐츠 */
                            Container(
                                padding: const EdgeInsets.only(left: 8, right: 8),
                                child: Text(''
                                    '오늘 오후 8시에 랭킹전 하실 분 구해요 저희는 어쩌구요 저쩌구요 .....'
                                    '그래서어쨌는데요그랬는데요 계속 이말은언제끝날까요 한번 길게써볼려요')
                            ),
                            /* 게시글 하단 */
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      leading: CircleAvatar(backgroundImage: AssetImage(images[index]),),
                                      title: Text("쵝오다운"),
                                      subtitle: Row(
                                        children: [
                                          Container(
                                            child: FaIcon(
                                              FontAwesomeIcons.medal,
                                              size: 16,
                                              color: Color(0xFFFFD700)
                                            ),
                                          ),
                                          Text("L1/마스터2/무소속"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(''),
                                        Text('10분 전',
                                          style: TextStyle(
                                            color: Colors.grey
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  controller: _controller,
                  itemCount: images.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          ),
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
