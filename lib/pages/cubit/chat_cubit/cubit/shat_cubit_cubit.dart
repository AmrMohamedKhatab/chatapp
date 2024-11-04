
import 'package:bloc/bloc.dart';
import 'package:chatapp/constans.dart';
import 'package:chatapp/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'shat_cubit_state.dart';

class ShatCubit extends Cubit<ShatState> {
  ShatCubit() : super(ShatInitial());

  CollectionReference messages =
   FirebaseFirestore.instance.collection(KMessagesCollection);

  void sendMessage({required String Message, required String email}){
    try {
  messages.add({
                KMessage:messages, KCreatedAt:DateTime.now(),'id':email}
                
                );
} on Exception catch (e) {
  
}
  }

 void getMessges(){
 messages.orderBy(KCreatedAt,descending: true).snapshots().listen((event)
  {
    List<MessageModel>messagesList=[];

    for(var doc in event.docs){
      
      messagesList.add(MessageModel.fromJson(doc));
    }
   emit(ShatSuccess(message: messagesList));
 },);
  }
}
