import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {this.title,
      this.titleStyle =
          const TextStyle(color: Colors.transparent, fontSize: 18.0),
      this.width = double.infinity,
      this.height = 50.0,
      this.color = const Color(0xfff33763),
      @required this.onPressed});

  final String title;
  final double width;
  final double height;
  final Color color;
  final TextStyle titleStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(width: width, height: height),
      child: RaisedButton(
        onPressed: onPressed,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(title, style: titleStyle),
        color: color,
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  CircleButton({this.width = double.infinity, this.height = 50.0, this.icon, this.color = Colors.grey, @required this.onPressed});

  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(maxWidth: width, maxHeight: height),
      onPressed: onPressed,
      child: icon,
      shape: CircleBorder(),
      elevation: 4,
      fillColor: Colors.white,
      padding: EdgeInsets.all(11),
    );
  }
}
