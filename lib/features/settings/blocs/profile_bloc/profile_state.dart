part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.error,
    this.status = Status.initial,
    this.user,
    this.image,
  });

  final UserModel? user;
  final Status status;
  final String? error;
  final String? image;

  factory ProfileState.initial(){
    return const ProfileState();
  }

  ProfileState copyWith({
    UserModel? user,
    Status? status,
    String? error,
    String? image,
}){
    return ProfileState(
      error: error,
      status: status ?? this.status,
      user: user ?? this.user,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [error, status, user, image];
}

// final class ProfileInitial extends ProfileState {
//   @override
//   List<Object> get props => [];
// }
