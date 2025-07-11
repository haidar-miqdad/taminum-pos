part of 'transaction_bloc.dart';

class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetTransactionEvent extends TransactionEvent {

  final TypeEnum? type;
  const GetTransactionEvent(this.type);

  @override
  // TODO: implement props
  List<Object?> get props => [type];
}

class CreateQrTransactionEvent extends TransactionEvent {
  final TransactionModel transaction;

  const CreateQrTransactionEvent(this.transaction);

  @override
  // TODO: implement props
  List<Object?> get props => [transaction];

}

class CheckQrTransactionEvent extends TransactionEvent {}

class CreateTransactionEvent extends TransactionEvent {

  final TransactionModel transaction;
  final TypeEnum? type;
  const CreateTransactionEvent( this.transaction, {this.type});

  @override
  // TODO: implement props
  List<Object?> get props => [transaction, type];
}


