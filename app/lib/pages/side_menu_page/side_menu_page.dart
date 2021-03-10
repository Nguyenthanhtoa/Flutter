
import 'package:flutter/material.dart';
import 'package:app/cores.dart';
import 'package:app/global/rxproperty.dart';
import 'package:app/managers/datamanager.dart';
import 'package:app/models/menu_model.dart';
import 'package:app/models/user_model.dart';
import 'package:app/pages/drawer_page/drawer_page.dart';

class SideMenuPage extends StatefulWidget {
  
  final _selectedMenuChanged = RxProperty<MenuModel>();
  Stream<MenuModel> get selectedMenuChanged => _selectedMenuChanged.stream;

  final _menuItems = <MenuModel>[
    MenuModel(MenuType.home),
    MenuModel(MenuType.profile),
    MenuModel(MenuType.logout)
  ];

  void onMenuChanged(MenuType type) {
    final menuItem = _menuItems.firstWhere((item) => item.type == type);
    if (menuItem != null)
      _selectedMenuChanged.accept(menuItem);
  }

  @override
  _SideMenuPageState createState() => _SideMenuPageState();

}

class _SideMenuPageState extends NoAppBarState<SideMenuPage> {

  final _dataManager = DataManager();
  MenuModel _selectedMenu;

  @override
  void initState() {
    super.initState();

    widget.selectedMenuChanged.listen((menuModel) => setState(() => _selectedMenu = menuModel));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildBody() {
    return ListView.builder(
        itemCount: widget._menuItems.length + 1,
        itemBuilder: (context, i) => i == 0 ? _buildHeader(_dataManager.user) : _buildCell(widget._menuItems[i- 1]));
  }

  Widget _buildHeader(UserModel user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.name),
      accountEmail: Text(user.email),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Theme.of(context).platform == TargetPlatform.iOS ? Colors.blue : Colors.white,
        child: Text(user.name, style: TextStyle(fontSize: 15.0))
      ),
    );
  }

  /* Side menu cell */
  Widget _buildCell(MenuModel model) {
    return ListTile(
      title: Text(model.title, style: TextStyle(fontSize: 18, color: Colors.black)),
      leading: Icon(model.iconData, size: 25),
      onTap: () => _itemPressed(model),
    );
  }

  /* Side menu cell selected */
  _itemPressed(MenuModel model) {
    if (model.type == MenuType.logout)
      _handleLogout();
    else {
      drawerKey.currentState.closeDrawer();
      widget._selectedMenuChanged.accept(model);
    }
  }

  /* Handle logout action */
  _handleLogout() {

  }


}