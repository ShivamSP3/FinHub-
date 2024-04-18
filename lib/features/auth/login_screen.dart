// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_node_auth/features/auth/signup_screen.dart';
import 'package:flutter_node_auth/widgets/custom_button.dart';
import 'package:flutter_node_auth/widgets/custom_textfield.dart';

import '../../services/auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  final _signInFormKey = GlobalKey<FormState>();
  
  void loginUser() {
    authService.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _signInFormKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 70),
                child: RichText(
                text: TextSpan(
                  text: 'Fin',
                  style: TextStyle(color: Colors.black,fontSize: 50),
                  children:[ TextSpan(
                    text: 'Hub',
                    style: TextStyle(color: Colors.blue,fontSize: 50)
                  )]
                ),
              ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.15,),
              const Text(
                "Login",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',obsecureText: true,
                ),
              ),
              const SizedBox(height: 50),
              CustomButton(onTap: () {
                 if(_signInFormKey.currentState!.validate()){        
                         loginUser();
                 }
              }, text: 'Login'),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Text( "Don't have an account? ",
                  style: TextStyle(color: Colors.black,fontSize: 20),),
                  GestureDetector(
                    onTap:() { 
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>SignupScreen()));
                    },
                    child: Text( "Sign Up",
                  style: TextStyle(color: Colors.blue,fontSize: 20),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
  