part of 'bottom_nav_bloc.dart';

sealed class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TapBottomNavEvent extends BottomNavEvent {
  const TapBottomNavEvent(this.index);

  final int index;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
