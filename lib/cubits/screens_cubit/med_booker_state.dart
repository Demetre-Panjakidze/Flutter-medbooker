part of 'med_booker_cubit.dart';

@immutable
abstract class MedBookerState {
  const MedBookerState();
}

class MedBookerInitial extends MedBookerState {
  const MedBookerInitial();
}

class MedBookerLoading extends MedBookerState {
  const MedBookerLoading();
}

class MedBookerLoaded extends MedBookerState {
  final String bla;
  const MedBookerLoaded({required this.bla});

  @override
  bool operator ==(covariant MedBookerLoaded other) {
    if (identical(this, other)) return true;

    return other.bla == bla;
  }

  @override
  int get hashCode => bla.hashCode;
}

class MedBookerError extends MedBookerState {
  final String bla;
  const MedBookerError({required this.bla});

  @override
  bool operator ==(covariant MedBookerError other) {
    if (identical(this, other)) return true;

    return other.bla == bla;
  }

  @override
  int get hashCode => bla.hashCode;
}
