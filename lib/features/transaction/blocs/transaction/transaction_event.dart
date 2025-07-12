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
  final String? referenceId;

  const CreateQrTransactionEvent(this.transaction, {this.referenceId});

  @override
  // TODO: implement props
  List<Object?> get props => [transaction];

}

class GetDetailTransactionEvent extends TransactionEvent {
  final String referenceId;

  const GetDetailTransactionEvent(this.referenceId);

  @override
  // TODO: implement props
  List<Object?> get props => [referenceId];

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


