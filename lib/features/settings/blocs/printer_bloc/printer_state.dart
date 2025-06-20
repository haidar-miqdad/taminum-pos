part of 'printer_bloc.dart';

class PrinterState extends Equatable {
  const PrinterState({
    this.printers = const [],
    this.error,
    this.status = Status.initial,
  });

  final List<BluetoothInfo> printers;
  final String? error ;
  final Status? status;

  factory PrinterState.initial(){
    return const PrinterState();
  }

  PrinterState copyWith({
     List<BluetoothInfo>? printers,
     String? error,
     Status? status,
}){
    return PrinterState(
      printers: printers ?? this.printers,
      error: error,
      status: status ?? this.status,
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [printers, status, error];



}

