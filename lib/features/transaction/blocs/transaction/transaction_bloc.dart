import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:flutter_taminum_mobile/features/transaction/models/model.dart';
import 'package:flutter_taminum_mobile/features/transaction/services/transaction_service.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionState.initial()) {
    on<GetTransactionEvent>((event, emit) async {
       try{
         emit(state.copyWith(status: Status.loading));
         final service = await TransactionService.all(event.type);
         emit(state.copyWith(status: Status.success, transactions: service));
       }catch(e){
         emit(state.copyWith(status: Status.failure, error: e.toString()));
       }
    });

    on<CreateTransactionEvent>((event, emit) async {
      try{
        emit(state.copyWith(status: Status.loading));
        await TransactionService.insert(event.transaction);
        emit(state.copyWith(status: Status.apply));
      }catch(e){
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });
  }
}
