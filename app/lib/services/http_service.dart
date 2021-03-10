import 'dart:convert';
import 'package:app/global/global.dart';
import 'package:app/managers/datamanager.dart';
import 'package:app/models/user_model.dart';
import 'package:http/http.dart' as http;

class HttpService {

  final _baseUrl = environment.value;
  final dataManager = DataManager();

  Map<String, String> get headers {
    return { "cookie": dataManager.cookie };
  }

  /* GET request */
  Future<String> _get(String path) {
    var url = "${this._baseUrl}${path}";

    return http.get(url, headers: headers).then((responses) {
      final jsonString = responses.body;
      var error = _validateServerError(jsonString);
      if (error != null)
        throw error;

      return jsonString;
    });
  }

  /* POST request */
  Future<String> _post(String path, {Map<String, String> body}) {
    var url = "${this._baseUrl}${path}";

    return http.post(url, body: body, headers: headers).then((responses) {
      if (path == "login")
        dataManager.cookie = "";

      final jsonString = responses.body;

      var error = _validateServerError(jsonString);
      if (error != null)
        throw error;

      return jsonString;
    });
  }

  _validateServerError(String jsonString) {
    if (jsonString != null) {
      try {
//        var model = ServerErrorModel.fromJson(json.decode(jsonString));
//        if (model != null && model.code != 0 && model.type != ErrorType.none)
//          return model;
      } catch(e) {
        print("_validateServerError $e");
      }
    }

    return null;
  }

  /* Application request apis */

  Future<UserModel> login({String email, String password}) {
    return _post("login", body: {"email": email, "password": password, "token": ""})
        .then((jsonString) => UserModel.fromJson(json.decode(jsonString)));
  }

}