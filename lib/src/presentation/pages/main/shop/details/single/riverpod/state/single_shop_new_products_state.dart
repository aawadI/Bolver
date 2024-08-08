import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'single_shop_new_products_state.freezed.dart';

@freezed
class SingleShopNewProductsState with _$SingleShopNewProductsState {
  const factory SingleShopNewProductsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> products,
  }) = _SingleShopNewProductsState;

  const SingleShopNewProductsState._();
}
