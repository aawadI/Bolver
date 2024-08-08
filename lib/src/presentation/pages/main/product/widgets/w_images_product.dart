import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'w_product_image_item.dart';
import '../../../../theme/theme.dart';
import '../../../../../models/models.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';

class WImagesProduct extends StatefulWidget {
  final String activeImageUrl;
  final List<Galleries>? galleries;
  final ValueSetter<String> onChangeActiveImage;

  const WImagesProduct({
    Key? key,
    required this.activeImageUrl,
    required this.onChangeActiveImage,
    this.galleries,
  }) : super(key: key);

  @override
  State<WImagesProduct> createState() => _WImagesProductState();
}

class _WImagesProductState extends State<WImagesProduct> {
  final PageController pageController = PageController();
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 518.r,
          width: double.infinity,
          child: PageView.builder(
            controller: pageController,
            itemCount: widget.galleries?.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(
                  top: Platform.isIOS
                      ? (MediaQuery.of(context).padding.top - 52.h)
                      : 0,
                ),
                height: 518.r,
                color: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                alignment: Alignment.topCenter,
                child: CachedNetworkImage(
                  imageUrl:
                      '${widget.galleries?[index].path}',
                  height: 488.r,
                  width: 1.sw,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) {
                    return MakeShimmer(
                      child: Container(
                        decoration:
                            const BoxDecoration(color: AppColors.mainBack),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      height: 518.r,
                      color: AppColors.white,
                      alignment: Alignment.center,
                      child: const Icon(
                        FlutterRemix.image_line,
                        size: 80,
                        color: AppColors.black,
                      ),
                    );
                  },
                ),
              );
            },
            onPageChanged: (s) {
              setState(() {
                selectIndex = s;
              });
            },
          ),
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 60.r,
            decoration: BoxDecoration(
              color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
              borderRadius: BorderRadius.circular(8.r),
            ),
            alignment: Alignment.center,
            child: SizedBox(
              height: 42.r,
              child: ListView.builder(
                physics: const CustomBouncingScrollPhysics(),
                padding: REdgeInsets.symmetric(horizontal: 13),
                scrollDirection: Axis.horizontal,
                itemCount: widget.galleries?.length,
                itemBuilder: (context, index) => WProductItemImageItem(
                  url: '${widget.galleries?[index].path}',
                  isActive: index == selectIndex,
                  onTap: () {
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
