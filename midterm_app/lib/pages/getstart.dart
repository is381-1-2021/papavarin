import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:lottie/lottie.dart';
import 'package:midterm_app/pages/1login.dart';
import 'package:midterm_app/pages/homesignup.dart';
import 'package:midterm_app/pages/login.dart';
import 'package:midterm_app/pages/signup.dart';

class GetstartPage extends StatefulWidget {
  @override
  _GetstartPageState createState() => _GetstartPageState();
}

class _GetstartPageState extends State<GetstartPage> {
  int _pageState = 0;
  var _bgColor = Colors.white;
  var _fontColor = Color(0xFF38b6ff);
  double _headingTop = 100;
  double _loginWidth = 0;
  double _loginHeight = 0;
  double _signupHeight = 0;
  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _loginOpacity = 1;
  double _signupYOffset = 0;
  double wdWidth = 0;
  double wdheight = 0;
  bool _keyboardVisible = false;
  final _formkey = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  String? _email = '';
  String? _firstName = '';
  String? _lastName = '';
  String? _password = '';
  String? _emailLogin = '';
  String? _passwordLogin = '';

  bool? _passwordVisible;

  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        _keyboardVisible = visible;
      });
    });
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    wdWidth = MediaQuery.of(context).size.width;
    wdheight = MediaQuery.of(context).size.height;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    _loginHeight = wdheight - 270;
    _signupHeight = wdheight - 270;
    switch (_pageState) {
      case 0:
        _bgColor = Colors.white;
        _fontColor = Color(0xFF38b6ff);
        _headingTop = 100;
        _loginWidth = wdWidth;
        _loginYOffset = wdheight;
        _loginHeight = _keyboardVisible ? wdheight : wdheight - 270;
        _loginXOffset = 0;
        _loginOpacity = 1;
        _signupYOffset = wdheight;
        break;
      case 1:
        _bgColor = Color(0xFF38b6ff);
        _fontColor = Colors.white;
        _headingTop = 90;
        _loginWidth = wdWidth;
        _loginYOffset = _keyboardVisible ? 150 : 270;
        _loginHeight = _keyboardVisible ? wdheight - 150 : wdheight - 270;
        _loginXOffset = 0;
        _loginOpacity = 1;
        _signupYOffset = wdheight;
        break;
      case 2:
        _bgColor = Color(0xFF38b6ff);
        _fontColor = Colors.white;
        _headingTop = 80;
        _loginWidth = wdWidth - 40;
        _loginYOffset = _keyboardVisible ? 130 : 240;
        _loginHeight = _keyboardVisible ? wdheight - 130 : wdheight - 240;
        _loginXOffset = 20;
        _loginOpacity = 0.7;
        _signupYOffset = _keyboardVisible ? 160 : 270;
        _signupHeight = _keyboardVisible ? wdheight - 160 : wdheight - 270;
        break;
    }
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: <Widget>[
          AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
              milliseconds: 1000,
            ),
            color: _bgColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                    });
                  },
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(
                            milliseconds: 1000,
                          ),
                          margin: EdgeInsets.only(
                            top: _headingTop,
                          ),
                          child: Text(
                            'Flash Card App',
                            style: TextStyle(
                              color: _fontColor,
                              fontSize: 35,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            'We want to make your learning more enjoyable and effective.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _fontColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Center(
                    child: Lottie.asset("assets/lottie/LoginImage.json"),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    },
                    child: Container(
                      margin: EdgeInsets.all(50),
                      padding: EdgeInsets.all(18),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFF38b6ff),
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
