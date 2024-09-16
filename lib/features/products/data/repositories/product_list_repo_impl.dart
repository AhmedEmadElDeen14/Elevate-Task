import 'package:dartz/dartz.dart';
import 'package:elevate_task/core/errors/failure.dart';
import 'package:elevate_task/features/products/data/data_sources/product_list_ds.dart';
import 'package:elevate_task/features/products/data/models/productModel.dart';
import 'package:elevate_task/features/products/domain/repositories/product_list_repo.dart';


class ProductListRepoImpl implements ProductListRepo {
  ProductRemoteDS productRemoteDS;

  ProductListRepoImpl(this.productRemoteDS);

  @override
  Future<Either<Failures, ProductModel>> getProductList() =>
      productRemoteDS.getProducts();
}
