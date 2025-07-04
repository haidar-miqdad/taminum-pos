part of 'transaction_bloc.dart';

class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetTransactionEvent extends TransactionEvent {

  final TypeEnum? type;
  const GetTransactionEvent({this.type});

  @override
  // TODO: implement props
  List<Object?> get props => [type];
}


