import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled6/auth/maipage.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key,required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email=TextEditingController(),_pass=TextEditingController();
  Future signin() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text.trim(), password: _pass.text.trim());
  }
  @override
  void dispose(){
    _email.dispose();_pass.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RiveAnimation.asset("assets/4054-8407-polito.riv",fit: BoxFit.fitHeight,),
          Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX:10,sigmaY:10),
                child: SizedBox(),
              )
          ),
          SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 350,),
                      TextField(
                        style: TextStyle(color: Colors.grey),
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter your email address',
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color:Colors.grey,),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0,color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2.0,color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        obscureText: true,
                        style: TextStyle(color: Colors.grey),
                        controller: _pass,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color:Colors.grey,),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0,color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2.0,color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: signin,
                          style:ButtonStyle(
                            shadowColor:MaterialStatePropertyAll(Colors.grey) ,
                            elevation: MaterialStatePropertyAll(5),
                            textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 19.8)),
                            backgroundColor: MaterialStatePropertyAll(Colors.blueGrey),
                          ) ,
                          child: Text('Login',style: TextStyle(color: Colors.white,),),
                        ),
                      ),
                      TextButton(
                        onPressed: widget.showRegisterPage,
                        child: Text('New User?Register Now',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
