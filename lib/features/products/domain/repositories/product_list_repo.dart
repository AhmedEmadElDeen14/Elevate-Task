import 'package:dartz/dartz.dart';
import 'package:elevate_task/core/errors/failure.dart';
import 'package:elevate_task/features/products/data/models/productModel.dart';


abstract class ProductListRepo {
  Future<Either<Failures, ProductModel>> getProductList();
}