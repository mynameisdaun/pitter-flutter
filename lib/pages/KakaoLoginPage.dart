import 'package:diet/pages/UserProfilePage.dart';
import 'package:diet/pages/calendar_exmaple_page.dart';
import 'package:diet/pages/splash.dart';
import 'package:diet/provider/user_profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:provider/provider.dart';

class KakaoLoginPage extends StatefulWidget {
  @override
  _KakaoLoginPageState createState() => _KakaoLoginPageState();
}

class _KakaoLoginPageState extends State<KakaoLoginPage> {

  late String _nickName;
  late String _email;
  late String _profileImageUrl;
  late String _accessToken;
  late String _refreshToken;
  static final storage = new FlutterSecureStorage();

  Future<void> _signInWithKakao(BuildContext context) async {
    final _userProfileProvider = Provider.of<UserProfileProvider>(context, listen: false);
    final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
      'response_type': 'code',
      'client_id': '45bd9ded862b0fbee9a6701805cadfba',
      'redirect_uri': 'http://172.20.10.2:8080/sign_in/kakao',
    });
    final result = await FlutterWebAuth.authenticate(
    url: url.toString(), callbackUrlScheme: "webauthcallback");
    final decode = Uri.decodeFull(result);
    print(decode);
    final body = Uri.parse(decode).queryParameters;
    print(body);
    _nickName = body['nickName']!;
    _email = body['email']!;
    _profileImageUrl = body['profileImageUrl']!;
    _accessToken = body['accessToken']!;
    _refreshToken = body['refreshToken']!;

    _userProfileProvider.setUserProfile(_nickName, _email, _profileImageUrl);

    await storage.write(
      key: 'accessToken',
      value: _accessToken
    );
    await storage.write(
        key: 'refreshToken',
        value: _refreshToken
    );
    Navigator.push(context
        , MaterialPageRoute(builder: (context) => UserProfilePage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                onPressed: () {
                  _signInWithKakao(context);
                },
                color: Colors.yellow,
                child: Text(
                  '카카오 로그인',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplashPage())
                  );
                },
                color: Colors.black45,
                child: Text(
                  '스플래쉬 페이지로 이동',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TableBasicsExample())
                  );
                },
                color: Colors.blue,
                child: Text(
                  '달력으 이동',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}