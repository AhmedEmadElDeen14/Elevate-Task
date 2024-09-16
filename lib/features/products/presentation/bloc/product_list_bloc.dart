import 'package:bloc/bloc.dart';
import 'package:elevate_task/core/errors/failure.dart';
import 'package:elevate_task/features/products/data/models/productModel.dart';
import 'package:elevate_task/features/products/domain/use_cases/get_product_list_use_case.dart';
import 'package:meta/meta.dart';


part 'product_list_event.dart';

part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  GetProductListUseCase getProductListUseCase;

  ProductListBloc({
    required this.getProductListUseCase,
  }) : super(ProductListInitial()) {
    on<ProductListEvent>((event, emit) async {
      emit(state.copyWith(screenStatus: ScreenStatus.loading));
      var res = await getProductListUseCase.call();
      print("----------------------------------------------");
      res.fold((l) {
        emit(state.copyWith(screenStatus: ScreenStatus.failure, failures: l));
      }, (r) {
        emit(state.copyWith(
            screenStatus: ScreenStatus.success, productModel: r));
      });
    });
  }
}
