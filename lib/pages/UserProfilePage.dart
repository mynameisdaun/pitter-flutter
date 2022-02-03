import 'package:diet/pages/KakaoLoginPage.dart';
import 'package:diet/pages/splash.dart';
import 'package:diet/provider/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  static final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16),
            Text(
              Provider.of<UserProfileProvider>(context).getNickName(),
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            Text(
              Provider.of<UserProfileProvider>(context).getEmail(),
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            Image.network(Provider.of<UserProfileProvider>(context).getProfileImageUrl()),
            SizedBox(height: 16),
            IconButton(
              onPressed: () {
              Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => KakaoLoginPage())
                  );
              },
              icon: Icon(Icons.west_outlined)),
            SizedBox(height: 16),
            IconButton(
                onPressed: () {
                  storage.delete(key: "accessToken");
                  storage.delete(key: "refreshToken");
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => KakaoLoginPage())
                  );
                },
                icon: Icon(Icons.delete)
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplashPage())
                  );
                },
                icon: Icon(Icons.account_circle_rounded)
            ),
            ]
        ),
      ),
    );
  }
}
