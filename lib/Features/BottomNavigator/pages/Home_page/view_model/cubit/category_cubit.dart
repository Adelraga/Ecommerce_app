import 'package:bloc/bloc.dart';
import 'package:ecommerce/Features/BottomNavigator/data/store_model/store_model.dart';
import 'package:ecommerce/Features/BottomNavigator/domain/Repo.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeRepo) : super(CategoryInitial());
    final HomeRepo homeRepo;
  Future<void> fetchCategory() async {
    emit(CategoryLoading());
    var result = await homeRepo.AllcCategoriesServices();
    result.fold((failure) => {emit(CategoryFailure(failure.errMessage))},
        (category) => {emit(CategorySuccess(category))});
  }
  Future<void> fetchCategoryItems({required String category}) async {
    emit(CategoryLoading());
    var result = await homeRepo.getCategoriesProducts(categoryName:category );
    result.fold((failure) => {emit(CategoryFailure(failure.errMessage))},
        (category) => {emit(CategoryItemsSuccess(category))});
  }
}

