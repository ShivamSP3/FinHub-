// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter_node_auth/features/widgets/bottom_nav.dart';
import 'package:flutter_node_auth/providers/userprovider.dart';
import 'package:flutter_node_auth/features/auth/login_screen.dart';
import 'package:flutter_node_auth/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../features/auth/signup_screen.dart';
import '../utils/constants.dart';

class AuthService{
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  })async{
    try {
      User user = User(id: '', name: name, email: email, trades: [],
      token: '', password: password);

      http.Response res = await http.post(Uri.parse('${Constants.uri}/api/signup'),
     // Method 1
      body: user.toJson(),
      headers: <String ,String>{
        'Content-Type':"application/json; charset=UTF-8"
      }
      );
      httpErrorHandling(response: res,
      context: context, 
      onSuccess: () {
              Get.snackbar(
              margin: EdgeInsets.all(10),
              'Sign Up Success', 'Account created login with the same credentials!'); 
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  void signInUser({
    required BuildContext context,
    required String email,
    required String password
  }) async{
    try {
      var userProvider = Provider.of<UserProvider>(context,listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(Uri.parse('${Constants.uri}/api/signin'),
     // alternate method to do this M2
      body: jsonEncode({
        'email': email,
        'password': password
      }),
      headers: <String ,String>{
        'Content-Type':"application/json; charset=UTF-8"
      },
      );
      httpErrorHandling(response: res,
         context: context, onSuccess: ()async {
      Get.snackbar( margin: EdgeInsets.all(10),'Log In', 'You are logged in successfully!');         
    SharedPreferences prefs = await SharedPreferences.getInstance();
         userProvider.setUser(res.body);
         await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
         navigator.pushAndRemoveUntil(MaterialPageRoute(
          builder: (context) =>  BottomNav(),),
           (route) => false);
       },);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  // get user data
  void getUserData(BuildContext context)async{
    try {
      var userProvider = Provider.of<UserProvider>(context,listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
       String ? token = prefs.getString('x-auth-token');
       if (token== null) {
         prefs.setString('x-auth-token', '');
       }
       var tokenRes = await http.post(Uri.parse('${Constants.uri}/tokenIsValid'),
       headers: <String ,String>{
        'Content-Type':"application/json; charset=UTF-8",
        'x-auth-token': token!
      },
       );
       var response = jsonDecode(tokenRes.body);
       if (response == true) {
         http.Response userRes = await http.get(Uri.parse('${Constants.uri}/')
         ,headers: <String ,String>{
        'Content-Type':"application/json; charset=UTF-8",
        'x-auth-token': token
      },
         );
         userProvider.setUser(userRes.body);
       }
    } catch (e) {
       showSnackBar(context, e.toString());
    }
  }
  void signOut(BuildContext context)async{
    final navigator = Navigator.of(context);
    SharedPreferences prefs  = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', '');
    navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen(),)
    , (route) => false);
  }

}