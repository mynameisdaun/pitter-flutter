import 'package:diet/provider/page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:kakao_flutter_sdk/all.dart';

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
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/exercise.gif'))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: ListView(
                  reverse: true,
                  padding: EdgeInsets.all(12),
                  children: [
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
                      padding: EdgeInsets.all(12),
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
                    // ElevatedButton.icon(
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Colors.white,
                    //       onPrimary: Colors.black87,
                    //       minimumSize: Size(double.infinity, 50),
                    //     ),
                    //     icon: FaIcon(FontAwesomeIcons.google),
                    //     onPressed: signIn,
                    //     label: Text('Google Signin')),
                    IconButton(
                      iconSize: 50.0,
                      icon: Image.asset('assets/login-google.png'),
                      onPressed: () {
                      },
                    ),
                    IconButton(
                      iconSize: 50.0,
                      icon: Image.asset('assets/login-naver.png'),
                      onPressed: () {

                      },
                    ),
                    IconButton(
                      iconSize: 50.0,
                      icon: Image.asset('assets/login-kakao.png'),
                      onPressed: () {
                        KakaoContext.clientId = 'dbd7b805e63d45b418a671b539090548';

                      },
                    ),
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

  Future signIn() async {
    final user = await GoogleSignInApi.login();

    if ( user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign in Failed'),));
    } else {
      print("====================[DEBUG START]====================");
      print("name:"+user.displayName!);
      print("email:"+user.email!);
      print("====================[DEBUG E N D]====================");
      /*Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoggedInPage(user: user),
      ));*/
    }
  }
}

class LoggedInPage extends StatelessWidget {
  final GoogleSignInAccount user;

  LoggedInPage({
    Key? key,
    required this.user,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Logged In'),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
          }, child: Text('Logout')
        )
      ],
    ),
    body: Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Profile',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 32,),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.photoUrl!),
          ),
          SizedBox(height: 8,),
          Text(
            'Name: ' + user.displayName!,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 8,),
          Text(
            'Email: ' + user.email!,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    ),
  );
}


class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

}
