import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<String> {
  CategoryCubit() : super('');

  void selectCategory(String category) {
    emit(category);
  }
}
