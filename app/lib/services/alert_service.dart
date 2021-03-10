import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertService {
  static const buttonColor = const Color(0xff0052cc);

  static const titleStyle = TextStyle(color: Colors.black, fontSize: 24.0);
  static const messageStyle =
      TextStyle(color: Color(0xff4c4c4c), fontSize: 18.0);

  static const yesStyle = TextStyle(color: Colors.white, fontSize: 18.0);
  static const noStyle = TextStyle(color: Color(0xff0153cd), fontSize: 18.0);

  Future<void> showAlert(
      {@required BuildContext context,
      String title,
      String message,
      String buttonTitle = "OK"}) {

    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: titleStyle),
          content: Text(message, style: messageStyle),
          actions: <Widget>[
            Container(
              constraints: BoxConstraints(minWidth: 100.0),
              child: FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(buttonTitle, style: noStyle),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<bool> showConfirmAlert(
      {@required BuildContext context,
      String title,
      String message,
      String yesTitle = "Yes",
      String noTitle = "NO"}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: titleStyle),
          content: Text(message, style: messageStyle),
          actions: <Widget>[
            Container(
              constraints: BoxConstraints(minWidth: 100.0),
              child: FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(noTitle, style: noStyle),
              ),
            ),
            Container(
              constraints: BoxConstraints(minWidth: 100.0),
              child: RaisedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(yesTitle, style: yesStyle),
                color: buttonColor,
                elevation: 0.0,
              ),
            ),
          ],
        );
      },
    );
  }

//  Future<void> showErrorAlert(
//      {@required BuildContext context, ServerErrorModel error}) {
//    return showAlert(
//        context: context, title: "Lỗi", message: error.localizedMessage);
//  }

    presentAlert(
      {@required BuildContext context,
      String title,
      String message,
      AlertType type,
      String buttonTitle = "OK"}) {
        final buttons = DialogButton(
          child: Text(buttonTitle, style: TextStyle(color: Colors.white, fontSize: 18)),
          onPressed: () => Navigator.pop(context)
        );
        Alert(context: context, type: type, title: title, desc: message, buttons: [buttons]).show();
    }

    presentConfirmAlert(
      {@required BuildContext context,
      String title,
      String message,
      String yesTitle = "Yes",
      String noTitle = "NO"}) {

        final yesBtn = DialogButton(
          child: Text(yesTitle, style: TextStyle(color: Colors.white, fontSize: 18)),
          onPressed: () => Navigator.of(context).pop(true)
        );

        final noBtn = DialogButton(
          child: Text(noTitle, style: TextStyle(color: Colors.white, fontSize: 18)),
          onPressed: () => Navigator.of(context).pop(false)
        );
        
        Alert(context: context, type: AlertType.none, title: title, desc: message, buttons: [yesBtn, noBtn]).show();
    }

}
