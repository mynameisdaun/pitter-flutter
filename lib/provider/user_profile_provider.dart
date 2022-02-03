import 'package:flutter/cupertino.dart';

class UserProfileProvider with ChangeNotifier {
  String _nickName = "";
  String _email = "";
  String _profileImageUrl = "";

  String getNickName() => _nickName;
  String getEmail() => _email;
  String getProfileImageUrl() => _profileImageUrl;

  void setUserProfile(String nickName, String email, String profileImageUrl) {
    _nickName=nickName;
    _email=email;
    _profileImageUrl=profileImageUrl;
    notifyListeners();
  }

}