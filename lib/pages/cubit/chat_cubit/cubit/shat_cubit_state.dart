part of 'shat_cubit_cubit.dart';

@immutable
abstract class ShatState {}

 class ShatInitial extends ShatState {}
 class ShatSuccess extends ShatState {
  List<MessageModel>message;
  ShatSuccess({required this.message});
 }