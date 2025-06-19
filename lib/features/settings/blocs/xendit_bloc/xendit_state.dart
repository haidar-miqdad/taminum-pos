part of 'xendit_bloc.dart';

class XenditState extends Equatable {
  const XenditState({this.error, this.status = Status.initial, this.key = 'default'});

  final String? error;
  final Status status;
  final String key;

  factory XenditState.initial(){
    return XenditInitial();
  }

  XenditState copyWith({
    String? error,
    Status? status,
    String? key,
  }){
    return XenditState(
      error: error,
      status: status ?? this.status,
      key: key ?? this.key,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [error, status, key];
}

final class XenditInitial extends XenditState {
  @override
  List<Object> get props => [];
}
