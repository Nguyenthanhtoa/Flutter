import 'package:app/models/user_model.dart';

class DataManager {

  static DataManager _instance;

  factory DataManager() => _instance ??= new DataManager._();

  DataManager._();

  String cookie;
  var user = UserModel(name: "Bobby", email: "bobby@gmail.com", );

}