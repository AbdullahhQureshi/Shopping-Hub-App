import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/main.dart';
import 'dart:convert';
import 'package:shopping_app/models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expirydate;
  String _userid;


  bool get isAuth {
    return _token != null;
  }

  String get token {
    if (_expirydate != null &&
        _expirydate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(
      String email, String password, String urlsegment) async {
    try {
      final url =
          'https://identitytoolkit.googleapis.com/v1/$urlsegment?key=AIzaSyAC-iigrECuQey9XWgl1Q9R8ucnz7VU1Fk';
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      final responsedata = json.decode(response.body);
      print(responsedata);
      if (responsedata['error'] != null) {
        throw HttpException(responsedata['error']['message']);
      }
      _token = responsedata['idToken'];
      _userid = responsedata['localId'];
      // print(userId);
      _expirydate = DateTime.now()
          .add(Duration(seconds: int.parse(responsedata['expiresIn'])));
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'accounts:signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'accounts:signInWithPassword');
  }
  Future<void> Upload_data(String username,String address,String phonenumber) async{
    final url="https://shpping-app-2be1d-default-rtdb.firebaseio.com/$_userid.json?auth=$_token";
    try{
      http.post(url,body: json.encode({
        'address':address,
        'username':username,
        'phonenumber':phonenumber,
      }),
      );
    }catch(error){
      print(error);
      throw(error);
    }
  }
  Future<void> update(String username,String address,String phonenumber) async{
    final url="https://shpping-app-2be1d-default-rtdb.firebaseio.com/$_userid.json?auth=$_token";
    try{
      http.put(url,body: json.encode({
        'address':address,
        'username':username,
        'phonenumber':phonenumber,
      }),
      );
    }catch(error){
      print(error);
      throw(error);
    }
  }
  Future<void> uploadJazzcashNumber(String phonenumber) async{
    final url="https://shpping-app-2be1d-default-rtdb.firebaseio.com/$_userid.json?auth=$_token";
    try{
      http.post(url,body: json.encode({
        'jazzcashNumber':phonenumber,
      }),
      );
    }catch(error){
      print(error);
      throw(error);
    }
  }

  Future<Map> fetchJazzcashNumber() async{
    final url="https://shpping-app-2be1d-default-rtdb.firebaseio.com/$_userid.json?auth=$_token";
    try{
      var response = await http.get(url);
      return (json.decode(response.body));
    }catch(error){
      print(error);
      throw(error);
    }
  }



}
