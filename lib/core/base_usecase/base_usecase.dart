import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T,Parameters> {
  T call(Parameters parameters);
}

//this class will created once in memory
class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}
