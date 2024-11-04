import 'dart:math';

import 'package:chatapp/Auth/cubit/auth_cubit.dart';
import 'package:chatapp/constans.dart';
import 'package:chatapp/pages/chat_page.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_par.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  String? email;

  String? password;
  static String id = 'registerPage';

  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is RegisterLoading){
          isLoading =true;
        }
        else if(state is RegisterSucces){
          isLoading =false;
          Navigator.pushNamed(context, ChatPage.id);
        }else if(state is RegisterFailure){
          showSnackBar(context,state.errMassage);
          isLoading =false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: KPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 75,
                  ),
                  Image.asset('assets/images/scholar.png'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scholar Chat',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Row(
                    children: [
                      Text(
                        'register',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButtom(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context)
                            .registerUser(email: email!, password: password!);
                      } else {}
                    },
                    text: 'Register',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already ave an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          '  Login',
                          style: TextStyle(color: Color(0xffc7EDE6)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
