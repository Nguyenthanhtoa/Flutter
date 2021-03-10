import 'package:flutter/material.dart';
import 'package:app/cores.dart';
import 'package:app/models/menu_model.dart';
import 'package:app/pages/home_page/home_page.dart';
import 'package:app/pages/login_page/login_page.dart';
import 'package:app/pages/side_menu_page/side_menu_page.dart';

final drawerKey = GlobalKey<_DrawerPageState>();
// final	_scaffoldKey = GlobalKey<ScaffoldState>();

class DrawerPage extends StatefulWidget {

  DrawerPage(): super(key: drawerKey);

  @override
  _DrawerPageState createState() => new _DrawerPageState();

}

class _DrawerPageState extends AppState<DrawerPage> {

  final _sideMenuPage = SideMenuPage();
  final _homePage = HomePage();
  final _loginPage = LoginPage();
  
  MenuModel _selectedMenu;
  
  @override
  void initState() {
    super.initState();

    subscriptions.add(_sideMenuPage.selectedMenuChanged.listen((menuModel) {
      setState(() => _selectedMenu = menuModel);
    }));
  }

  void openDrawer() {
    print("=========== openDrawer");
    scaffoldKey.currentState.openDrawer();
  }

  void closeDrawer() {
    Navigator.of(context).pop();
  }

  void changeToMenu(MenuType type) {
    _sideMenuPage.onMenuChanged(type);
  }

  @override
  Widget buildBody() {
    return _getDetailPage();
  }

  @override
  Widget buildDrawer() {
    return Drawer(child: _sideMenuPage);
  }

  Widget _getDetailPage() {
    switch (_selectedMenu?.type) {
      case MenuType.home:
        return _homePage;

      case MenuType.logout:
        return _loginPage;

      default:
        return _homePage;
    }
  }

}