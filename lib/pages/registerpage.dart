

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rive/rive.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key,required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _email=TextEditingController(),_pass=TextEditingController(),_confirmpass=TextEditingController(),_name=TextEditingController();
  @override
  void dispose(){
    _email.dispose();_pass.dispose();_confirmpass.dispose();_name.dispose();
    super.dispose();
  }
  Future signup() async{
    if(_pass.text.trim()==_confirmpass.text.trim()){
      UserCredential result=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text.trim(), password: _pass.text.trim());
      try{
        User? user=result.user;
        user?.updateDisplayName(_name.text.trim());
        return (user);
      }
      catch(e){
        print(e.toString());
        return null;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RiveAnimation.asset("assets/4054-8407-polito.riv",fit: BoxFit.fitHeight,),
          Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX:20,sigmaY:10),
                child: SizedBox(),
              )
          ),
          SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 280,),
                      TextField(
                        style: TextStyle(color: Colors.grey),
                        controller: _name,
                        decoration: InputDecoration(
                          labelText: 'FirstName',
                          hintText: 'Enter your First name',
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
                      SizedBox(height: 10,),
                      TextField(
                        obscureText: true,
                        style: TextStyle(color: Colors.grey),
                        controller: _confirmpass,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Re-enter your password',
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
                          onPressed: signup,
                          style:ButtonStyle(
                            shadowColor:MaterialStatePropertyAll(Colors.grey) ,
                            elevation: MaterialStatePropertyAll(5),
                            textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 19.8)),
                            backgroundColor: MaterialStatePropertyAll(Colors.blueGrey),
                          ) ,
                          child: Text('SignUp',style: TextStyle(color: Colors.white,),),
                        ),
                      ),
                      TextButton(
                        onPressed: widget.showLoginPage,
                        child: Text('Aldready a user?Login here',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
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