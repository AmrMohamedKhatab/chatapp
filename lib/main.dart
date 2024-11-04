import 'package:chatapp/Auth/cubit/auth_cubit.dart';
import 'package:chatapp/pages/Login_page.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/cubit/chat_cubit/cubit/shat_cubit_cubit.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ShcolarChat());
}

class ShcolarChat extends StatelessWidget {
  const ShcolarChat({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(create: (context)=>AuthCubit()),
        BlocProvider(create: (context)=>ShatCubit())
      ],
      child: MaterialApp(
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id: (context) => ChatPage(),
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
