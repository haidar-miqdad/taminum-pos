import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:open_settings/open_settings.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

import '../../../features.dart';

part 'printer_event.dart';
part 'printer_state.dart';

class PrinterBloc extends Bloc<PrinterEvent, PrinterState> {
  PrinterBloc() : super(PrinterState.initial()) {
    on<GetPrinterEvent>((event, emit) async {
      try{
        var status = await Permission.bluetoothConnect.status;
        if (status.isGranted) {
          var statusScan = await Permission.bluetoothScan.status;

          if (statusScan.isGranted) {
            final listResult = await PrintBluetoothThermal.pairedBluetooths;

            emit(state.copyWith(status: Status.success, printers: listResult));
          } else {
            var requestScan = await Permission.bluetoothScan.request();

            if (requestScan.isGranted) {
              add(GetPrinterEvent());
            }
          }
        } else {
          final permission = await Permission.bluetoothConnect.request();
          if (permission.isGranted) {
            add(GetPrinterEvent());
          }
        }
      }catch(e){
        emit(state.copyWith(error: e.toString(), status: Status.failure));
      }
    });

    on<OpenSettingPrinterEvent>((event, emit) async {
      OpenSettings.openBluetoothSetting();
    });

    on<TestPrinterEvent>((event, emit) async {
      try {
        await PrintBluetoothThermal.connect(macPrinterAddress: event.macAddress);

        List<int> ticket = await ReceiptTemplate.ticket();

        await PrintBluetoothThermal.writeBytes(ticket);
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });

    on<TransactionPrinterEvent>((event, emit) async {
      try {
        await PrintBluetoothThermal.connect(
          macPrinterAddress: state.printers.first.macAdress,
        );

        List<int> ticket = await ReceiptTemplate.ticket(
          transaction: event.transaction,
        );

        await PrintBluetoothThermal.writeBytes(ticket);
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });


  }
}
