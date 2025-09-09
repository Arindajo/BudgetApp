import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
 static const baseUrl = 'http://192.168.34.2/api/accounts';
 static final storage=FlutterSecureStorage();

 static Future<Map<String, dynamic>>signup(String username, String email, String password) async{
  final response =await http.post(
    Uri.parse('$baseUrl/signup/'),
    headers:{'Content-Type':'application/json'},
    body:jsonEncode({'username':username,'email':email,'password':password})
  );
  return{
  'statusCode':response.statusCode,
  'body':jsonDecode(response.body),
 };

 }
 
 static Future<Map<String, dynamic>>login(String username, String password) async{
  final response = await http.post(
    Uri.parse('$baseUrl/login/'),
    headers:{'Content-Type':'application/json'},
    body:jsonEncode({'username':username, 'password':password})
  );


   if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    await storage.write(key: 'access_token', value: data['access']);
    await storage.write(key: 'refresh_token', value: data['refresh']);
  }
  return{
    'statusCode':response.statusCode,
    'body':jsonDecode(response.body)
  };
 }
}