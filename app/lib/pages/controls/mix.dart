import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermAndPrivacyText extends StatelessWidget {

  static const termStyle = TextStyle(color: Color(0xff696d6f), fontSize: 11.0);
  static const versionStyle = TextStyle(color: Colors.green, fontSize: 10.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("v1.0.8 Development", textAlign: TextAlign.center, style: versionStyle),
          RichText(
            text: TextSpan(
              text: '@2018 86Homestays All Rights Reserved ',
              style: termStyle,
            ),
          )
        ],
      ),
    );
  }
}

/* show/hide */
class ShowWhen extends StatelessWidget {
  final Widget child;
  final bool condition;
  ShowWhen({this.child, this.condition});

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: this.condition ? 1.0 : 0.0, child: this.child);
  }
}

/* show/remove */
class RenderWhen extends StatelessWidget {
  final Widget child;
  final bool condition;
  RenderWhen({this.child, this.condition});

  @override
  Widget build(BuildContext context) {
    return this.condition ? this.child : Container();
  }
}

/* NoInternetConnection */
class NoInternetConnection extends StatelessWidget {
  final VoidCallback action;

  NoInternetConnection({@required this.action});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[        
        Text(
          'Connect to the internet & refresh',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColorLight,
            child: Icon(Icons.refresh, size: 30.0,),
            onPressed: action,
          ),
        ),
      ],
    );
  }
}
