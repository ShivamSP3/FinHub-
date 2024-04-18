import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/auth/login_screen.dart';
import 'package:flutter_node_auth/features/widgets/bottom_nav.dart';
import 'package:flutter_node_auth/providers/userprovider.dart';
import 'package:flutter_node_auth/services/auth_services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
   Splash({super.key});

  AuthService authService = AuthService();
  
  String token ='';
  @override
  Widget build(BuildContext context) {
  token = Provider.of<UserProvider>(context).user.token;

    return authCheck();
  }
    Widget authCheck(){
  print('TOken: $token');
    if (token!='') {
      return BottomNav();
    }else{
    return LoginScreen();
    }
  }
}
