part of 'transaction_bloc.dart';

class TransactionState extends Equatable {
  const TransactionState({
    this.status = Status.initial,
    this.error,
    this.transactions = const [],
    this.item,
  });

  final Status status;
  final String? error;
  final List<TransactionModel> transactions;
  final TransactionModel? item;

  factory TransactionState.initial() {
    return TransactionState();
  }

  TransactionState copyWith({
    Status? status,
    String? error,
    List<TransactionModel>? transactions,
    TransactionModel? item,
  }) {
    return TransactionState(
      status: status ?? this.status,
      error: error,
      transactions: transactions ?? this.transactions,
      item: item ?? this.item,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, error, transactions, item];
}
