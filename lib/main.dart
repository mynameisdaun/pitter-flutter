import 'package:diet/pages/KakaoLoginPage.dart';
import 'package:diet/pages/auth_page.dart';
import 'package:diet/provider/page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:provider/provider.dart';

void main() {
  KakaoContext.clientId = '45bd9ded862b0fbee9a6701805cadfba';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KakaoLogin',
      home: KakaoLoginPage(),
    );
    /*return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageNotifier())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Consumer<PageNotifier>(
          builder: (context, pageNotifier, child) {
            return Navigator(
              pages: [
                AuthPage()
              ],
              onPopPage: (route, result) {
                if(!route.didPop(result)) {
                  return false;
                }
                return true;
              },
            );*/
            // return Navigator(
            //     pages: [
            //       MaterialPage(
            //           key: ValueKey(MyHomePage.pageName),
            //           child: MyHomePage(title: 'Flutter 1')
            //       ),
            //       if(pageNotifier.currentPage == AuthPage.pageName) AuthPage(),
            //     ],
            //     onPopPage:(route, result) {
            //       if(!route.didPop(result)) {
            //         return false;
            //       }
            //       return true;
            //     }
            // );
  }
}


