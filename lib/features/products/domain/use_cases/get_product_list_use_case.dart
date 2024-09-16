import 'package:dartz/dartz.dart';
import 'package:elevate_task/core/errors/failure.dart';
import 'package:elevate_task/features/products/data/models/productModel.dart';
import 'package:elevate_task/features/products/domain/repositories/product_list_repo.dart';


class GetProductListUseCase {
  ProductListRepo productListRepo;

  GetProductListUseCase(this.productListRepo);

  Future<Either<Failures, ProductModel>> call() =>
      productListRepo.getProductList();
}
