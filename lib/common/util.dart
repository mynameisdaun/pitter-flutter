import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const USER_NICK_NAME = 'USER_NICK_NAME';
const STATUS_LOGIN = 'STATUS_LOGIN';
const STATUS_LOGOUT = 'STATUS_LOGOUT';

void showToast(String message) {
  Fluttertoast.showToast(
      fontSize: 13,
      backgroundColor: Colors.black45,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      msg: '$message'
  );
}