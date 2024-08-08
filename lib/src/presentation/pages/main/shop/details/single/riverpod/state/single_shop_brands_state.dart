import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'single_shop_brands_state.freezed.dart';

@freezed
class SingleShopBrandsState with _$SingleShopBrandsState {
  const factory SingleShopBrandsState({
    @Default(false) bool isLoading,
    @Default([]) List<BrandData> brands,
  }) = _SingleShopBrandsState;

  const SingleShopBrandsState._();
}