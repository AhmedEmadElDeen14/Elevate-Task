import 'package:dartz/dartz.dart';
import 'package:elevate_task/core/errors/failure.dart';
import 'package:elevate_task/features/products/data/models/productModel.dart';

abstract class ProductRemoteDS {
  Future<Either<Failures, ProductModel>> getProducts();
}
