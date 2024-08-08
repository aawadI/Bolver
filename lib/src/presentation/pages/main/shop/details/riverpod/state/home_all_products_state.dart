import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:g_customer/src/models/data/all_product_data.dart';
part 'home_all_products_state.freezed.dart';

@freezed
class HomeAllProductsState with _$HomeAllProductsState {
  const factory HomeAllProductsState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default(0) int totalProductsCount,
    @Default([]) List<AllProductData> products,
  }) = _HomeAllProductsState;

  const HomeAllProductsState._();
}