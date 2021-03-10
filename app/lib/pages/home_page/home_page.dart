import 'package:flutter/material.dart';
import 'package:app/cores.dart';
import 'package:app/pages/drawer_page/drawer_page.dart';
import 'package:app/services/alert_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends AppBarState<HomePage> {

  final _alertService = AlertService();

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
    return Center(child: Text("Home Page", style: TextStyle(fontSize: 25)));
  }

  /* Navigation bar goes here */
  @override
  Widget buildAppBarLeading() {
    return IconButton(
        icon: Icon(Icons.menu, size: 30),
        onPressed: () => drawerKey.currentState.openDrawer());
  }

  @override
  Widget buildAppBarTitle() {
    return Text("Home");
  }

}
