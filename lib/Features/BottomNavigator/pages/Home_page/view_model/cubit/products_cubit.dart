import 'package:bloc/bloc.dart';
import 'package:ecommerce/Features/BottomNavigator/data/store_model/store_model.dart';
import 'package:ecommerce/Features/BottomNavigator/domain/Repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.homeRepo) : super(ProductsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchProduct() async {
    emit(ProductsLoading());
    var result = await homeRepo.getAllProducts();
    result.fold((failure) => {emit(ProductsFailure(failure.errMessage))},
        (products) => {emit(ProductsSuccess(products))});
  }
}
