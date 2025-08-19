import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:flutter_taminum_mobile/features/features.dart';

part 'receipt_event.dart';
part 'receipt_state.dart';

class ReceiptBloc extends Bloc<ReceiptEvent, ReceiptState> {
  ReceiptBloc() : super(ReceiptState.initial()) {
    on<GetReceiptEvent>((event, emit) async {
      try {
        emit(ReceiptState(status: Status.loading));

        final service = await ReceiptService.get();
        emit(ReceiptState(status: Status.apply, receipt: service));
      } catch (e) {
        emit(ReceiptState(status: Status.failure, error: e.toString()));
      }
    });

    on<SubmitReceiptEvent>((event, emit) async {
      try {
        emit(ReceiptState(status: Status.loading));

        final service = await ReceiptService.insert(
          ReceiptModel(desc: event.desc, message: event.message),
        );
        emit(ReceiptState(status: Status.success, receipt: service));
      } catch (e) {
        emit(ReceiptState(status: Status.failure, error: e.toString()));
      }
    });
  }
}
