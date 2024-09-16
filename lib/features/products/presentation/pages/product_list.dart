import 'package:elevate_task/core/api/api_manager.dart';
import 'package:elevate_task/core/utils/app_colors.dart';
import 'package:elevate_task/core/utils/app_images.dart';
import 'package:elevate_task/features/products/data/data_sources/product_list_ds_impl.dart';
import 'package:elevate_task/features/products/data/models/productModel.dart';
import 'package:elevate_task/features/products/data/repositories/product_list_repo_impl.dart';
import 'package:elevate_task/features/products/domain/use_cases/get_product_list_use_case.dart';
import 'package:elevate_task/features/products/presentation/bloc/product_list_bloc.dart';
import 'package:elevate_task/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductListBloc(
        getProductListUseCase: GetProductListUseCase(
          ProductListRepoImpl(
            ProductRemoteDSImpl(
              ApiManager(),
            ),
          ),
        ),
      )..add(ProductListEvent()),
      child: BlocConsumer<ProductListBloc, ProductListState>(
        listener: (context, state) {
          if (state.screenStatus == ScreenStatus.failure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.failures?.message ?? "An error occurred."),
              ),
            );
            print("${state.failures?.message}");
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: state.screenStatus == ScreenStatus.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.blueColor,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(10.w.h),
                    child: state.productModel == null ||
                            state.productModel?.products == null
                        ? const Center(child: Text('No products available'))
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: (192 / 237),
                              crossAxisCount: 2,
                              mainAxisSpacing: 16.h,
                              crossAxisSpacing: 16.w,
                            ),
                            itemBuilder: (context, index) {
                              var product =
                                  state.productModel!.products![index];
                              return ProductItem(products: product);
                            },
                            itemCount:
                                state.productModel?.products?.length ?? 0,
                          ),
                  ),
          );
        },
      ),
    );
  }
}
