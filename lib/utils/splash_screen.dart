import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/auth/login_screen.dart';
import 'package:flutter_node_auth/features/widgets/bottom_nav.dart';
import 'package:flutter_node_auth/providers/userprovider.dart';
import 'package:flutter_node_auth/services/auth_services.dart';
import 'package:flutter_node_auth/utils/splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key,  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  {

  AuthService authService = AuthService();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:  Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset(
                    'assets/icon/FinHub.gif',
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          'https://clipartstation.com/wp-content/uploads/2018/09/full-stop-clipart-1.png',
                          height: 30,
                          color: Colors.black,
                        ),
                        Text(
                          'Trade',
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.network(
                          'https://clipartstation.com/wp-content/uploads/2018/09/full-stop-clipart-1.png',
                          height: 30,
                          color: Colors.black,
                        ),
                        Text(
                          'Watch Charts',
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: [
                        Image.network(
                          'https://clipartstation.com/wp-content/uploads/2018/09/full-stop-clipart-1.png',
                          height: 30,
                          color: Colors.black,
                        ),
                        Text(
                          'Stay Updated with news',
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.network(
                          'https://clipartstation.com/wp-content/uploads/2018/09/full-stop-clipart-1.png',
                          height: 30,
                          color: Colors.black,
                        ),
                        Text(
                          'Track stock prices',
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      duration: 5000,
      splashIconSize: MediaQuery.of(context).size.height,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      nextScreen: Splash());
  }
}