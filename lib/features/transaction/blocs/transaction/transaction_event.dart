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

class CreateTransactionEvent extends TransactionEvent {

  final TransactionModel transaction;
  final TypeEnum? type;
  const CreateTransactionEvent( this.transaction, {this.type});

  @override
  // TODO: implement props
  List<Object?> get props => [transaction, type];
}


