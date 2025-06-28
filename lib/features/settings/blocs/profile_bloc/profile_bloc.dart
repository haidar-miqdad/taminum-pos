import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_taminum_mobile/features/features.dart';
import '../../../../core/core.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<GetProfileEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));
        final service = await ProfileService.getUser();
        emit(state.copyWith(status: Status.apply, user: service, image: service?.imageUrl));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });
    on<SubmitProfileEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));
        final service = await ProfileService.insert(UserModel(name: event.name, email: event.email, phoneNumber: event.phoneNumber, imageUrl: state.image ?? ''));
        emit(state.copyWith(status: Status.success, user: service));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });

    on<GetImageProfileEvent>((event, emit) async {
      try {
        final picker = await ImageHelper.getImage();
        emit(state.copyWith(image: picker));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });
  }
}
