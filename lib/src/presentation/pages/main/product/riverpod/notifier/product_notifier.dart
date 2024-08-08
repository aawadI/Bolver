import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/handlers/handlers.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../../repository/repository.dart';
import '../../../profile/viewed_products/riverpod/notifier/viewed_products_notifier.dart';
import '../../../shop/details/riverpod/notifier/shop_details_notifier.dart';
import '../state/product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductsRepository _productsRepository;
  final GalleryRepository _galleryRepository;

  ProductNotifier(this._productsRepository, this._galleryRepository)
      : super(const ProductState());

  Future<void> getProductDetails(
    BuildContext context,
    String uuid,
    ViewedProductsNotifier? viewedProductsNotifier,
    ShopDetailsNotifier? shopDetailsNotifier, {
    ValueSetter<ProductData?>? fetched,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(
        isLoading: true,
        product: null,
        activeImageUrl: '',
        reviewFile: null,
        rating: 4.0,
      );
      final response = await _productsRepository.getProductDetails(uuid);
      response.when(
        success: (data) {
          final List<Stocks> stocks = data.data?.stocks ?? <Stocks>[];
          state = state.copyWith(
            product: data.data,
            activeImageUrl: '${data.data?.img}',
            initialStocks: stocks,
            reviews: data.data?.reviews ?? [],
            isLoading: false,
          );
          if (stocks.isNotEmpty) {
            final int groupsCount = stocks[0].extras?.length ?? 0;
            final List<int> selectedIndexes = List.filled(groupsCount, 0);
            initialSetSelectedIndexes(context, selectedIndexes);
          }
          if (data.data != null) {
            saveToViewedProducts(context, data.data?.id, shopDetailsNotifier);
          }
          // fetchRelatedProducts(context);
          fetched?.call(data.data);
          fetchViewedProducts(context);
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false);
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          } else if (failure == const NetworkExceptions.notFound('Not found')) {
            context.popRoute();
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.notFound),
            );
          }
          debugPrint('==> get product details failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> fetchViewedProducts(BuildContext context) async {
    final List<int> ids = LocalStorage.instance.getViewedProductsList();
    if (ids.isEmpty) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isViewedProductsLoading: true, viewedProducts: []);
      final response = await _productsRepository.getProductsByIds(ids);
      response.when(
        success: (data) async {
          final List<ProductData> viewedProducts = data.data ?? [];
          final List<ProductData> filtered = [];
          for (final productId in ids) {
            for (final viewedProduct in viewedProducts) {
              if (productId == viewedProduct.id &&
                  productId != state.product?.id) {
                filtered.add(viewedProduct);
              }
            }
          }
          state = state.copyWith(
            viewedProducts: filtered,
            isViewedProductsLoading: false,
          );
        },
        failure: (failure) {
          state = state.copyWith(isViewedProductsLoading: false);
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          }
          debugPrint('==> get viewed products failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  void updateSelectedIndexes(BuildContext context, int index, int value) {
    final newList = state.selectedIndexes.sublist(0, index);
    newList.add(value);
    final postList =
        List.filled(state.selectedIndexes.length - newList.length, 0);
    newList.addAll(postList);
    initialSetSelectedIndexes(context, newList);
  }

  void initialSetSelectedIndexes(BuildContext context, List<int> indexes) {
    state = state.copyWith(selectedIndexes: indexes);
    updateExtras(context);
  }

  void updateExtras(BuildContext context) {
    final int groupsCount = state.initialStocks[0].extras?.length ?? 0;
    final List<TypedExtra> groupExtras = [];
    for (int i = 0; i < groupsCount; i++) {
      if (i == 0) {
        final TypedExtra extras = getFirstExtras(state.selectedIndexes[0]);
        groupExtras.add(extras);
      } else {
        final TypedExtra extras =
            getUniqueExtras(groupExtras, state.selectedIndexes, i);
        groupExtras.add(extras);
      }
    }
    final Stocks? selectedStock = getSelectedStock(groupExtras);
    int stockCount = 0;
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    for (final product in cartProducts) {
      if (product.selectedStock?.id == selectedStock?.id) {
        stockCount = product.quantity ?? 0;
        break;
      }
    }
    state = state.copyWith(
      typedExtras: groupExtras,
      selectedStock: selectedStock,
      stockCount: stockCount,
    );
  }

  Stocks? getSelectedStock(List<TypedExtra> groupExtras) {
    List<Stocks> stocks = List.from(state.initialStocks);
    for (int i = 0; i < groupExtras.length; i++) {
      String selectedExtrasValue =
          groupExtras[i].uiExtras[state.selectedIndexes[i]].value;
      stocks = getSelectedStocks(stocks, selectedExtrasValue, i);
    }
    return stocks[0];
  }

  List<Stocks> getSelectedStocks(List<Stocks> stocks, String value, int index) {
    List<Stocks> included = [];
    for (int i = 0; i < stocks.length; i++) {
      if (stocks[i].extras?[index].value == value) {
        included.add(stocks[i]);
      }
    }
    return included;
  }

  // TypedExtra getFirstExtras(int selectedIndex) {
  //   ExtrasType type = ExtrasType.text;
  //   String title = '';
  //   final List<String> uniques = [];
  //   for (int i = 0; i < state.initialStocks.length; i++) {
  //     uniques.add(state.initialStocks[i].extras?[0].value ?? '');
  //     title = state.initialStocks[i].extras?[0].group?.translation?.title ?? '';
  //     type = AppHelpers.getExtraTypeByValue(
  //         state.initialStocks[i].extras?[0].group?.type);
  //   }
  //   final setOfUniques = uniques.toSet().toList();
  //   final List<UiExtra> extras = [];
  //   for (int i = 0; i < setOfUniques.length; i++) {
  //     if (selectedIndex == i) {
  //       extras.add(UiExtra(setOfUniques[i], true, i, ''));
  //     } else {
  //       extras.add(UiExtra(setOfUniques[i], false, i, ''));
  //     }
  //   }
  //   return TypedExtra(type, extras, title, 0);
  // }

  //
  // TypedExtra getUniqueExtras(
  //   List<TypedExtra> groupExtras,
  //   List<int> selectedIndexes,
  //   int index,
  // ) {
  //   List<Stocks> includedStocks = List.from(state.initialStocks);
  //   for (int i = 0; i < groupExtras.length; i++) {
  //     final String includedValue =
  //         groupExtras[i].uiExtras[selectedIndexes[i]].value;
  //     includedStocks = getIncludedStocks(includedStocks, i, includedValue);
  //   }
  //   final List<String> uniques = [];
  //   String title = '';
  //   ExtrasType type = ExtrasType.text;
  //   for (int i = 0; i < includedStocks.length; i++) {
  //     uniques.add(includedStocks[i].extras?[index].value ?? '');
  //     title = includedStocks[i].extras?[index].group?.translation?.title ?? '';
  //     type = AppHelpers.getExtraTypeByValue(
  //         includedStocks[i].extras?[index].group?.type ?? '');
  //   }
  //   final setOfUniques = uniques.toSet().toList();
  //   final List<UiExtra> extras = [];
  //   for (int i = 0; i < setOfUniques.length; i++) {
  //     if (selectedIndexes[groupExtras.length] == i) {
  //       extras.add(UiExtra(setOfUniques[i], true, i,
  //           '${state.product!.stocks?[index].extras![index].code}'));
  //     } else {
  //       extras.add(UiExtra(setOfUniques[i], false, i,
  //           '${state.product!.stocks?[index].extras![index].code}'));
  //     }
  //   }
  //   return TypedExtra(type, extras, title, index);
  // }

  TypedExtra getUniqueExtras(
    List<TypedExtra> groupExtras,
    List<int> selectedIndexes,
    int index,
  ) {
    List<Stocks> includedStocks = List.from(state.initialStocks);
    for (int i = 0; i < groupExtras.length; i++) {
      final String includedValue =
          groupExtras[i].uiExtras[selectedIndexes[i]].value;
      includedStocks = getIncludedStocks(includedStocks, i, includedValue);
    }
    final List<String> uniques = [];
    final Map<String, String> valueToCodeMap = {};
    String title = '';
    ExtrasType type = ExtrasType.text;

    for (int i = 0; i < includedStocks.length; i++) {
      final extra = includedStocks[i].extras?[index];
      if (extra != null) {
        uniques.add(extra.value ?? '');
        valueToCodeMap[extra.value ?? ''] = extra.code ?? '';
        title = extra.group?.translation?.title ?? '';
        type = AppHelpers.getExtraTypeByValue(extra.group?.type ?? '');
      }
    }

    final setOfUniques = uniques.toSet().toList();
    final List<UiExtra> extras = [];
    for (int i = 0; i < setOfUniques.length; i++) {
      final value = setOfUniques[i];
      var code = valueToCodeMap[value] ?? '';
      if (code.contains(RegExp(r'^\d+$'))) {
        code = code.substring(0, 2);
      }
      extras.add(UiExtra(
        value: value,
        isSelected: selectedIndexes[groupExtras.length] == i,
        index: i,
        code: code,
      ));
    }
    return TypedExtra(
      type: type,
      uiExtras: extras,
      title: title,
      groupIndex: index,
    );
  }

  TypedExtra getFirstExtras(int selectedIndex) {
    ExtrasType type = ExtrasType.text;
    String title = '';
    final List<String> uniques = [];
    final Map<String, String> valueToCodeMap = {};

    for (int i = 0; i < state.initialStocks.length; i++) {
      final extra = state.initialStocks[i].extras?[0];
      if (extra != null) {
        uniques.add(extra.value ?? '');
        valueToCodeMap[extra.value ?? ''] = extra.code ?? '';
        title = extra.group?.translation?.title ?? '';
        type = AppHelpers.getExtraTypeByValue(extra.group?.type ?? '');
      }
    }

    final setOfUniques = uniques.toSet().toList();
    final List<UiExtra> extras = [];
    for (int i = 0; i < setOfUniques.length; i++) {
      final value = setOfUniques[i];
      var code = valueToCodeMap[value] ?? '';
      if (RegExp(r'[^\d]').hasMatch(code)) {
        code = code.substring(0, 2);
      }
      extras.add(UiExtra(
        value: value,
        isSelected: selectedIndex == i,
        index: i,
        code: code,
      ));
    }
    return TypedExtra(
      type: type,
      uiExtras: extras,
      title: title,
      groupIndex: 0,
    );
  }

  List<Stocks> getIncludedStocks(
    List<Stocks> includedStocks,
    int index,
    String includedValue,
  ) {
    List<Stocks> stocks = [];
    for (int i = 0; i < includedStocks.length; i++) {
      if (includedStocks[i].extras?[index].value == includedValue) {
        stocks.add(includedStocks[i]);
      }
    }
    return stocks;
  }

  Future<void> saveToViewedProducts(
    BuildContext context,
    int? productId,
    ShopDetailsNotifier? shopDetailsNotifier,
  ) async {
    final List<int> ids = LocalStorage.instance.getViewedProductsList();
    ids.insert(0, productId ?? 0);
    LocalStorage.instance.setViewedProductsList(ids.toSet().toList());
  }

  void changeActiveImageUrl(String url) {
    state = state.copyWith(activeImageUrl: url);
  }

  void refreshStockCount() {
    state = state.copyWith(stockCount: 0);
  }

  void increaseStockCount(BuildContext context) {
    if ((state.selectedStock?.quantity ?? 0) < (state.product?.minQty ?? 0)) {
      return;
    }
    int newCount = state.stockCount;
    if (newCount >= (state.product?.maxQty ?? 100000) ||
        newCount >= (state.selectedStock?.quantity ?? 100000)) {
      AppHelpers.showCheckFlash(
          context, AppHelpers.getTranslation(TrKeys.noMoreProducts));
      return;
    }
    if (newCount < (state.product?.minQty ?? 0)) {
      newCount = state.product?.minQty ?? 1;
      state = state.copyWith(stockCount: newCount);

      addProductToCart(false);
    } else {
      newCount = newCount + 1;
      state = state.copyWith(stockCount: newCount);
      addProductToCart(true);
    }
  }

  void decreaseStockCount(BuildContext context) {
    int newCount = state.stockCount;
    if (newCount < 1) {
      return;
    }
    if (newCount <= (state.product?.minQty ?? 0)) {
      newCount = 0;
      state = state.copyWith(stockCount: newCount);
      deleteProductFromCart(state.product?.minQty ?? 0);
    } else {
      newCount = newCount - 1;
      state = state.copyWith(stockCount: newCount);
      deleteProductFromCart(1);
    }
  }

  void addProductToCart(bool isIncreasing) {
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    bool isProductAlreadyAdded = false;
    int addedIndex = 0;
    for (int i = 0; i < cartProducts.length; i++) {
      if (cartProducts[i].selectedStock?.product?.id == state.product?.id &&
          cartProducts[i].selectedStock?.id == state.selectedStock?.id) {
        isProductAlreadyAdded = true;
        addedIndex = i;
        break;
      }
    }
    if (isProductAlreadyAdded) {
      final newCartProduct = cartProducts[addedIndex].copyWith(
        quantity: (cartProducts[addedIndex].quantity ?? 0) +
            (isIncreasing ? 1 : state.stockCount),
      );
      cartProducts[addedIndex] = newCartProduct;
    } else {
      bool hasImageType = false;
      Extras? imageExtras;
      for (final extra in state.selectedStock?.extras ?? <Extras>[]) {
        if (AppHelpers.getExtraTypeByValue(extra.group?.type ?? '') ==
            ExtrasType.image) {
          hasImageType = true;
          imageExtras = extra;
          break;
        }
      }
      cartProducts.insert(
        0,
        CartProductData(
          shopID: state.product?.shopId,
          selectedStock: state.selectedStock,
          quantity: state.stockCount,
          imageUrl: hasImageType ? imageExtras?.value : state.product?.img,
          title: state.product?.translation?.title,
        ),
      );
    }
    LocalStorage.instance.setCartProducts(cartProducts);
  }

  void deleteProductFromCart(int decreaseCount) {
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    int addedIndex = 0;
    for (int i = 0; i < cartProducts.length; i++) {
      if (cartProducts[i].selectedStock?.product?.id == state.product?.id &&
          cartProducts[i].selectedStock?.id == state.selectedStock?.id) {
        addedIndex = i;
        break;
      }
    }
    final int newQuantity =
        (cartProducts[addedIndex].quantity ?? 0) - decreaseCount;
    if (newQuantity <= 0) {
      cartProducts.removeAt(addedIndex);
    } else {
      final newCartProduct = cartProducts[addedIndex]
          .copyWith(quantity: newQuantity, shopID: state.product?.shopId);
      cartProducts[addedIndex] = newCartProduct;
    }
    LocalStorage.instance.setCartProducts(cartProducts);
  }

  Future<void> likeOrUnlikeProduct(int? productId) async {
    final List<int> likedProducts =
        LocalStorage.instance.getLikedProductsList();
    bool alreadyLiked = false;
    int indexLiked = 0;
    for (int i = 0; i < likedProducts.length; i++) {
      if (likedProducts[i] == productId) {
        alreadyLiked = true;
        indexLiked = i;
      }
    }
    if (alreadyLiked) {
      likedProducts.removeAt(indexLiked);
    } else {
      if (state.product != null) {
        likedProducts.insert(0, productId ?? 0);
      }
    }
    LocalStorage.instance.setLikedProductsList(likedProducts.toSet().toList());
    state = state.copyWith();
  }

  void setReviewFile(XFile? file) {
    state = state.copyWith(reviewFile: file);
  }

  void setReviewText(String value) {
    state = state.copyWith(reviewText: value);
  }

  void setRating(double value) {
    state = state.copyWith(rating: value);
  }

  void updateState(ProductData? productData) {
    int stockCount = 0;
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    for (final product in cartProducts) {
      if (product.selectedStock?.product?.id == productData?.id) {
        stockCount = product.quantity ?? 0;
        break;
      }
    }
    state = state.copyWith(stockCount: stockCount);
  }

  Future<void> addReview(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isReviewing: true);
      String? imageUrl;
      if (state.reviewFile != null) {
        final response = await _galleryRepository.uploadImage(
          state.reviewFile!,
          UploadType.reviews,
        );
        response.when(
          success: (data) {
            imageUrl = data.imageData?.title;
          },
          failure: (failure) {
            debugPrint('===> image upload failure: $imageUrl');
          },
        );
      }
      final response = await _productsRepository.addReview(
        state.product?.uuid ?? '',
        state.reviewText,
        state.rating,
        imageUrl,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(isReviewing: false);
          context.popRoute();
          getProductDetails(context, state.product?.uuid ?? '', null, null);
        },
        failure: (failure) {
          state = state.copyWith(isReviewing: false);
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          } else if (failure == const NetworkExceptions.unauthorisedRequest()) {
            LocalStorage.instance.deleteToken();
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
            );
            context.router.replace(const LoginRoute());
          }
          debugPrint('==> add review failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }
}
