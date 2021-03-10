import 'package:flutter/material.dart';

class HudService {

  static bool _isShowing = false;

  show({
    @required BuildContext context,
    String status = "Loading..."
  }) {
    if (_isShowing) hide(context);
    _isShowing = true;

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.black38,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  hide(BuildContext context) {
    if (!_isShowing) return;
    _isShowing = false;

    Navigator.of(context).pop();
  }
}