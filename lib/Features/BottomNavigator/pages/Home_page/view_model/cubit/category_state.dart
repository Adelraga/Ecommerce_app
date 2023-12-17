part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<String> category;

  CategorySuccess(this.category);
}

final class CategoryItemsSuccess extends CategoryState {
  final List<StoreModel> books;

  CategoryItemsSuccess(this.books);
}

final class CategoryFailure extends CategoryState {
  final String errMessage;

  CategoryFailure(this.errMessage);
}
