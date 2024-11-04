import 'package:chatapp/constans.dart';

class MessageModel
{
  final String message;
  final String id;

  MessageModel({required this.message,required this.id});

factory MessageModel.fromJson(JosnData)
{
  return MessageModel(message: JosnData[KMessage],id: JosnData['id']);
}
}