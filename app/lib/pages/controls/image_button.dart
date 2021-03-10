import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  ImageButton(
      {this.title,
      this.iconData,
      this.color,
      this.fontSize = 18,
      this.width = double.infinity,
      this.height = 50.0,
      this.isTrailingIcon = true,
      this.isEnabled = true,
      @required this.onPressed});

  final String title;
  final IconData iconData;
  final Color color;
  final double fontSize;
  final double width;
  final double height;
  final bool isTrailingIcon;
  final bool isEnabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1 : 0.7,
      child: RaisedButton(
      onPressed: onPressed,
      color: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: this.iconData == null ? _buildText() : _buildMain(),
      ),
    ),
    );
  }

  List<Widget> _buildMain() {
    return isTrailingIcon ? _buildTrailing() : _buildLeading();
  }

  List<Widget> _buildLeading() {
    return [
      Icon(iconData, color: color),
      Text(title, style: TextStyle(color: color, fontSize: fontSize))
    ];
  }

  List<Widget> _buildTrailing() {
    return [
      Text(title, style: TextStyle(color: color, fontSize: fontSize)),
      Icon(iconData, color: color),
    ];
  }

  List<Widget> _buildText() {
    return [Text(title, style: TextStyle(color: color, fontSize: fontSize))];
  }
}
