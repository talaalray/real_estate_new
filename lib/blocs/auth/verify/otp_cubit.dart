import 'package:flutter_bloc/flutter_bloc.dart';

class OtpCubit extends Cubit<List<String>> {
  OtpCubit() : super(List.filled(4, ""));

  void updateDigit(int index, String value) {
    if (index < 0 || index >= state.length) return;
    if (value.isNotEmpty && !RegExp(r'^[0-9]$').hasMatch(value)) return;

    final updated = List<String>.from(state);
    updated[index] = value;
    emit(updated);
  }

  String get fullCode => state.join();

  void clear() => emit(List.filled(4, ""));
}