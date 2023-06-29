import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'med_booker_state.dart';

class MedBookerCubit extends Cubit<MedBookerState> {
  final Widget _screen;
  MedBookerCubit(this._screen) : super(const MedBookerInitial());
}
