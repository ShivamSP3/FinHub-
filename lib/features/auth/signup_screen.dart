
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_node_auth/widgets/custom_button.dart';

import '../../widgets/custom_textfield.dart';
import '../../services/auth_services.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final AuthService authService = AuthService();
    final _signUpFormKey = GlobalKey<FormState>();


  void signupUser() {
    authService.signUpUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _signUpFormKey,
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
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              const Text(
                "Signup",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height:70),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  controller: nameController,
                  hintText: 'Enter your name',
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 40),
              CustomButton(onTap:() {
                 if(_signUpFormKey.currentState!.validate()){        
                         signupUser();
                 }
              }, text: 'Login'),
                 SizedBox(height: 30,),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Text( "Already have an account? ",
                  style: TextStyle(color: Colors.black,fontSize: 20),),
                  GestureDetector(
                    onTap:() { 
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>LoginScreen()));
                    },
                    child: Text( "Login",
                  style: TextStyle(color: Colors.blue,fontSize: 20),),
                  )
                ],)
            ],
          ),
        ),
      ),
    );
  }
}