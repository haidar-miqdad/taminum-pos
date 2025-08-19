part of 'receipt_bloc.dart';

class ReceiptEvent extends Equatable {
  const ReceiptEvent();

  @override
  List<Object> get props => [];
}

class GetReceiptEvent extends ReceiptEvent {}

class SubmitReceiptEvent extends ReceiptEvent {
  final String message;
  final String desc;

  const SubmitReceiptEvent({required this.message, required this.desc});

  @override
  List<Object> get props => [message, desc];
}
