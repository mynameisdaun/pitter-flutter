import 'package:diet/common/pitterConstant.dart';
import 'package:flutter/material.dart';

class createFeedPage extends StatefulWidget {
  const createFeedPage({Key? key}) : super(key: key);

  @override
  _createFeedPageState createState() => _createFeedPageState();
}

class _createFeedPageState extends State<createFeedPage> {
  final List<String> _valueList = ['스피드전', '아이템전'];
  String _selectedValue = '스피드전';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryBackGroundColor,
        iconTheme: IconThemeData(color: primaryIconColor),
        leading: IconButton(
          icon: Icon(Icons.west),
          onPressed: () {},
        ),
        title: Text('게시글 작성하기',
            style: TextStyle(color: Colors.black, fontSize: 14)),
        actions: <Widget>[
          TextButton(
              onPressed: () {},
              child: Text('완료',
                  style: TextStyle(
                    color: Colors.grey,
                  )))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton(
          value: _selectedValue,
          items: _valueList.map((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedValue = value.toString();
            });
          },
        ),
      ),
    );
  }
}
