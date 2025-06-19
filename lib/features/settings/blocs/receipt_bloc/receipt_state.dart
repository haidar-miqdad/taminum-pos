part of 'receipt_bloc.dart';

class ReceiptState extends Equatable {
  const ReceiptState({this.receipt, this.status = Status.initial, this.error});

  final ReceiptModel? receipt;
  final Status status;
  final String? error;

  factory ReceiptState.initial(){
    return ReceiptState();
  }

  ReceiptState copyWith({
     ReceiptModel? receipt,
     Status? status,
     String? error,
}){
    return ReceiptState(
      receipt: receipt ?? this.receipt,
      status: status ?? this.status,
      error: error,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [receipt, status, error];

}


