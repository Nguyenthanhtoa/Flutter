import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum MenuType {
  home, profile, logout
}

class MenuModel {

  final MenuType type;

  MenuModel(this.type);

  String get title {
    switch (type) {
      case MenuType.home:
        return "Home";

      case MenuType.profile:
        return "Account";

      default:
        return "Logout";
    }
  }

  IconData get iconData {
    switch (type) {
      case MenuType.home:
        return Icons.home;

      case MenuType.profile:
        return FontAwesomeIcons.user;
        
      default:
        return FontAwesomeIcons.signOutAlt;
    }
  }

}