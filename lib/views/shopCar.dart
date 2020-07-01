
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:learn_flutter/config/const.dart';

class myViews3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutDemoViewsState();
  }

}

class AboutDemoViewsState extends State<myViews3> {

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }

}





class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          middle: const Text('欢迎登录拼少少'),
        ),
        body: Center ()
    );
  }}