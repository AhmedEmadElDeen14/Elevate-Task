import 'package:dartz/dartz.dart';
import 'package:elevate_task/core/api/api_manager.dart';
import 'package:elevate_task/core/api/end_points.dart';
import 'package:elevate_task/core/errors/failure.dart';
import 'package:elevate_task/features/products/data/data_sources/product_list_ds.dart';
import 'package:elevate_task/features/products/data/models/productModel.dart';

class ProductRemoteDSImpl implements ProductRemoteDS {
  ApiManager apiManager;

  ProductRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, ProductModel>> getProducts() async {
    try {
      var response = await apiManager.getData(EndPoints.productList);

      print('API Response Data: ${response.data}');

      List<dynamic> dataList = response.data as List<dynamic>;

      ProductModel productModel = ProductModel.fromJsonList(dataList);
      return Right(productModel);
    } catch (e) {
      return Left(RemoteFailure(e.toString()));
    }
  }
}
