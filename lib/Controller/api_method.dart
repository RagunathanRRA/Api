import 'dart:developer';
import 'package:http/http.dart' as http;
import '../model/model_class.dart';
import '../model/getclass.dart';
import '../services/api_config.dart';



class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}


class ApiService_second {
  Future<List<Product>?> getproducts() async {
    // print("test");
    try {
      var url = Uri.parse(Apiconnect.baseUrl + Apiconnect.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Product> _model = productFromJson(response.body);
        // print(_model.length);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}




