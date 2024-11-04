import 'package:chatapp/Auth/cubit/auth_cubit.dart';
import 'package:chatapp/constans.dart';
import 'package:chatapp/pages/chat_page.dart';


import 'package:chatapp/pages/register_page.dart';
import 'package:chatapp/widgets/custom_buttom.dart';
import 'package:chatapp/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_par.dart';

class LoginPage extends StatelessWidget {
  bool isLoading = false;
  static String id = 'Login Page';

  GlobalKey<FormState> formkey = GlobalKey();

  String? email, password;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is LoginLoading){
          isLoading =true;
        }
        else if(state is LoginSucces){
          isLoading =false;
          Navigator.pushNamed(context, ChatPage.id);
        }else if(state is LoginFailure){
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
                        'Login',
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
                    obscureText: true,
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
                        isLoading = true;

                        BlocProvider.of<AuthCubit>(context)
                        .loginUser(email: email!, password: password!);

                      
                      } else {}
                    },
                    text: 'LoGIN',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont\'t have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: Text(
                          '  register',
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

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
