import 'package:chatapp/constans.dart';
import 'package:chatapp/model/message.dart';
import 'package:chatapp/pages/cubit/chat_cubit/cubit/shat_cubit_cubit.dart';
import 'package:chatapp/widgets/chat_Buble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage'; // route

  final ScrollController _controller = ScrollController();

  List<MessageModel> messagesList = [];

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: KPrimaryColor,
        title: Text('chat'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ShatCubit, ShatState>(
              listener: (context, state) {
                if (state is ShatSuccess) {
                  messagesList = state.message;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBuble(
                              message: messagesList[index],
                            )
                          : ChatBubleForFriend(message: messagesList[index]);
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                controller.clear();
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              decoration: InputDecoration(
                hintText: 'send Message',
                suffixIcon: Icon(
                  Icons.send,
                  color: KPrimaryColor,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: KPrimaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
