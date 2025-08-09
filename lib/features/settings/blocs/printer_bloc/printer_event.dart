part of 'printer_bloc.dart';

class PrinterEvent extends Equatable {
  const PrinterEvent();

  @override
  List<Object?> get props => [];
}

class GetPrinterEvent extends PrinterEvent{}

class TestPrinterEvent extends PrinterEvent{
  final String macAddress;

  const TestPrinterEvent(this.macAddress);

  @override
  List<Object?> get props => [macAddress];
}

class OpenSettingPrinterEvent extends PrinterEvent{}



class TransactionPrinterEvent extends PrinterEvent {
  final TransactionModel transaction;

  const TransactionPrinterEvent(this.transaction);

  @override
  List<Object> get props => [transaction];
}


