import 'package:diet/provider/page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends Page {
  static final String pageName = 'AuthPage';

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this, builder: (context) => AuthWidget());
  }
}

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.transparent, width: 0));

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();

  bool _isRegister = true;

  Duration _duration = Duration(milliseconds: 200);
  Curve _curve = Curves.fastOutSlowIn;

  static final double _cornerRadius = 8.0;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      onTap: () {
        Provider.of<PageNotifier>(context, listen: false).goToMain();
      },
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/giphy.gif'))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: ListView(
                  reverse: true,
                  padding: EdgeInsets.all(16),
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 36,
                      child: Image.asset('assets/logo.png'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ButtonBar(
                      children: [
                        FlatButton(
                            onPressed: () {
                              setState(() {
                                _isRegister = false;
                              });
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: _isRegister ? FontWeight.w400 :FontWeight.w600,
                                  color: _isRegister? Colors.black45 : Colors.black87),
                            )),
                        FlatButton(
                            onPressed: () {
                              setState(() {
                                _isRegister = true;
                              });
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: _isRegister ? FontWeight.w600 : FontWeight.w400,
                                  color: _isRegister ? Colors.black87 : Colors.black45),
                              ),
                            ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    buildTextFormField("Email Address", _emailController),
                    SizedBox(
                      height: 8,
                    ),
                    buildTextFormField("Password", _passwordController),
                    AnimatedContainer(
                        duration: _duration,
                        height: _isRegister ? 8 : 0,
                        curve: _curve,
                    ),
                    AnimatedContainer(
                      child: buildTextFormField(
                          "Password Confirmation", _passwordConfirmController),
                      duration: _duration,
                      height: _isRegister ? 60 : 0,
                      curve: _curve,
                      ),
                    SizedBox(
                      height: 16,
                    ),
                    FlatButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("all right!");
                          Provider.of<PageNotifier>(context, listen: false)
                            .goToMain();
                        }
                      },
                      color: Colors.white54,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(_cornerRadius)),
                      padding: EdgeInsets.all(16),
                      child: Text( _isRegister ? "Register" : "Login"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(
                      height: 33,
                      thickness: 1,
                      color: Colors.white54,
                      indent: 16,
                      endIndent: 16,
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton('assets/login-naver.png', () {
                          print("hi");
                        }),
                        _buildSocialButton('assets/login-kakao.png', () {
                          print("hi");
                        }),
                        _buildSocialButton('assets/login-google.png', () {
                          print("hi");
                        }),
                      ],
                    )
                  ].reversed.toList(),
                ),
              ),
            ),
          )),
    ));
  }

  Container _buildSocialButton(String imagePath, Function onPressed) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white54),
      child:
          IconButton(onPressed: onPressed(), icon: const Icon(Icons.volume_up)
              //icon: ImageIcon(AssetImage("assets/naver_square.png"),),
              ),
    );
  }

  TextFormField buildTextFormField(
      String labelText, TextEditingController controller) {
    return TextFormField(
      cursorColor: Colors.white,
      controller: controller,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "이메일을 입력해 주세요.";
        }
        return null;
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.white54,
          border: _border,
          errorBorder: _border.copyWith(
              borderSide: BorderSide(color: Colors.black, width: 3)),
          enabledBorder: _border,
          focusedBorder: _border,
          errorStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          labelStyle: TextStyle(color: Colors.black)),
    );
  }
}
