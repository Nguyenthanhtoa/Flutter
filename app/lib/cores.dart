import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app/global/color.dart';

abstract class AppState<T extends StatefulWidget> extends State<T> {

  final	scaffoldKey = GlobalKey<ScaffoldState>();
  final subscriptions = <StreamSubscription<dynamic>>[];
  var isLoading = false;

  @override
  void dispose() {
    super.dispose();

    subscriptions.forEach((s) => s.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      drawer: buildDrawer(),
      body: isLoading ? Center(child: CircularProgressIndicator()) : buildBody(),
    );
  }

  Widget buildBody();

  Widget buildDrawer() => null;

  Widget buildAppBar() => null;

}

abstract class AppBarState<T extends StatefulWidget> extends AppState<T> {

  @override
  Widget buildAppBar() {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: AppColors.navBgColor,
      iconTheme: IconThemeData(color: Colors.white),
      leading: buildAppBarLeading(),
      title: buildAppBarTitle(),
      actions: buildAppBarActions(),
      bottom: buildAppBarBottom(),
    );
  }

  Widget buildAppBarLeading() => null;

  Widget buildAppBarTitle() => null;

  List<Widget> buildAppBarActions() => null;

  PreferredSizeWidget buildAppBarBottom() => null;
}

abstract class NoAppBarState<T extends StatefulWidget> extends AppState<T> { }











