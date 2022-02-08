import 'dart:async';

import 'package:diet/pages/UserProfilePage.dart';
import 'package:diet/pages/home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'KakaoLoginPage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController controller;
  late String _nickName;
  late String _email;
  late String _profileImageUrl;
  late Dio dio;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: false);
    Future.delayed(Duration(seconds: 2), ()=> _checkUser(context));
  }
  void _checkUser(context) async {
    final storage = new FlutterSecureStorage();
    print('${await storage.readAll()}');
    var accessToken = await storage.read(key: "accessToken");
    var refreshToken = await storage.read(key: "refreshToken");
    //TODO: 로그인 여부에 따라서 페이지 이동 분기처리 해줘야 한다.
    if(accessToken != null) {
      dio = new Dio();
      //var response = dio.get('http://172.20.10.2:8080/member/')
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home())
      );
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => KakaoLoginPage())
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor:1.0),
        child: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/logo_without_text.svg',
                      height : screenHeight * (240/360),
                      width:  screenWidth  * 0.354375,
                    ),
                    Container(
                      height : screenHeight * (6/360),
                      width:  screenWidth  * (240/360),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          child: LinearProgressIndicator(
                            value: controller.value,
                            semanticsLabel: 'Linear progress indicator',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height : screenWidth * (18/360)),
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => KakaoLoginPage())
                          );
                        },
                        icon: Icon(Icons.adb_rounded)
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}