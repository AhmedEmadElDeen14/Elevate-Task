import 'package:elevate_task/core/utils/app_colors.dart';
import 'package:elevate_task/core/utils/styles.dart';
import 'package:elevate_task/features/products/data/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductItem extends StatefulWidget {
  final Products? products;

  const ProductItem({super.key, required this.products});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFav = false;
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    if (widget.products == null) {
      return Center(child: Text('Product not available'));
    } else {
      return InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(width: 2.w, color: AppColors.blueColor),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: widget.products!.image ?? "",
                        fit: BoxFit.contain,
                        width: double.infinity,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error_outline, size: 40),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.all(2.h.w),
                          margin: EdgeInsets.only(left: 6.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (isFav) {
                                isFav = false;
                              } else {
                                isFav = true;
                              }
                              setState(() {});
                            },
                            child: isFav
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent,
                                  )
                                : const Icon(
                                    Icons.favorite_outline,
                                    color: AppColors.blueColor,
                                  ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text(
                      widget.products!.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: BodyTextStyle.fontNormal,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 8.w),
                      Text(
                        "EGP ${widget.products?.price}",
                        style: BodyTextStyle.fontNormal,
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        "${(widget.products!.price! + 50).toInt()}",
                        style: BodyTextStyle.fontNormal
                            .copyWith(decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 8.w, bottom: 13.h, right: 8.w),
                    child: Row(
                      children: [
                        Text(
                          "Review",
                          style: BodyTextStyle.fontNormal.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "(${widget.products!.rating!.rate})",
                          style: BodyTextStyle.fontNormal.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            if (isAdded) {
                              isAdded = false;
                            } else {
                              isAdded = true;
                            }
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.all(5.w.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                color: AppColors.blueColor),
                            child: isAdded
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      );
    }
  }
}
