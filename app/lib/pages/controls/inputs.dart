import 'package:flutter/material.dart';
import 'package:app/global/color.dart';
import 'package:app/pages/controls/ensure_visible.dart';

class AppTextField extends StatelessWidget {
  // final FocusNode _focusNode = new FocusNode();

  AppTextField(
      {this.placeholder,
      this.controller,
      this.focusNode,
      this.isSecure = false,
      this.maxLines = 1,
      this.fontSize = 18,
      this.textColor = Colors.black,
      this.textAlign = TextAlign.start,
      this.keyboardType = TextInputType.text});

  final String placeholder;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isSecure;
  final int maxLines;
  final double fontSize;
  final Color textColor;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    return EnsureVisibleWhenFocused(
      focusNode: focusNode,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        color: Colors.transparent,
        child: TextField(
          maxLines: maxLines,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isSecure,
          focusNode: focusNode,
          style: TextStyle(color: textColor, fontSize: fontSize),
          onSubmitted: (String txt) => onSubmitted,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize),
            border: InputBorder.none,
          ),
          textAlign: textAlign,
        ),
      ),
    );
  }
}

class BorderTextField extends StatelessWidget {
  BorderTextField({this.textController, this.textFocusNode, this.placeHolder});

  final TextEditingController textController;
  final FocusNode textFocusNode;
  final String placeHolder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.thinGrey,
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(5),
          shape: BoxShape.rectangle),
      child: AppTextField(
        controller: textController,
        focusNode: textFocusNode,
        fontSize: 18,
        textColor: Colors.black,
        placeholder: placeHolder,
      ),
    );
  }
}

class SearchControl extends StatelessWidget {
  SearchControl(
      {this.textController,
      this.textFocusNode,
      this.placeHolder,
      this.onPressSearch});

  final TextEditingController textController;
  final FocusNode textFocusNode;
  final String placeHolder;
  final VoidCallback onPressSearch;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
            child: AppTextField(
          controller: textController,
          focusNode: textFocusNode,
          fontSize: 18,
          textColor: Colors.black,
          placeholder: placeHolder,
          textAlign: TextAlign.center,
        )),
        Container(
            width: 50,
            height: 50,
            child: IconButton(
                icon: Icon(Icons.search, size: 25), onPressed: onPressSearch))
      ],
    );
  }
}
