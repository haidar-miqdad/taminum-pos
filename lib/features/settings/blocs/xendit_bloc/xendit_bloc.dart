import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

import '../../services/xendit_service.dart';

part 'xendit_event.dart';
part 'xendit_state.dart';

class XenditBloc extends Bloc<XenditEvent, XenditState> {
  XenditBloc() : super(XenditState.initial()) {
    on<GetXenditEvent>((event, emit) async {
      try {
        emit(XenditState(status: Status.loading));

        final service = await XenditServiceSet.get();

        emit(
          XenditState(status: Status.apply, key: service ?? 'not set up yet'),
        );
      } catch (e) {
        emit(XenditState(status: Status.failure, error: e.toString()));
      }
    });

    on<SubmitXenditEvent>((event, emit) async {
      try {
        emit(XenditState(status: Status.loading));

        final service = await XenditServiceSet.insert(event.key);

        emit(XenditState(status: Status.success, key: service));
      } catch (e) {
        emit(XenditState(status: Status.failure, error: e.toString()));
      }
    });
  }
}
