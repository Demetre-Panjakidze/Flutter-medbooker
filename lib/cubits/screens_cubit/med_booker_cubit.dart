import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'med_booker_state.dart';

class MedBookerCubit extends Cubit<MedBookerState> {
  MedBookerCubit() : super(MedBookerInitial());
}
