import 'package:flutter/material.dart';
import 'package:app/cores.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends NoAppBarState<LoginPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildBody() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Center(child: Text("Login Page", style: TextStyle(fontSize: 25))),
    );
  }

}
