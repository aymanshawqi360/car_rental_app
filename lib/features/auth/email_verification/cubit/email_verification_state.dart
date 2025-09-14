import 'package:equatable/equatable.dart';

sealed class EmailVerificationState extends Equatable {
  const EmailVerificationState();

  @override
  List<Object> get props => [];
}

final class EmailVerificationInitial extends EmailVerificationState {
  @override
  List<Object> get props => [];
}

final class EmailVerificationSuccess extends EmailVerificationState {
  @override
  List<Object> get props => [];
}

final class EmailVerificationLoading extends EmailVerificationState {
  @override
  List<Object> get props => [];
}

final class EmailVerificationFailure extends EmailVerificationState {
  @override
  List<Object> get props => [];
}
