import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/constants/constants.dart';

part 'new_products_state.freezed.dart';

@freezed
class NewProductsState with _$NewProductsState{
  const factory NewProductsState({
    @Default(false) bool isLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isMoreLoading,
    @Default(null) int? totalProductTotal,
    @Default([]) List<ProductData> products,
    @Default([]) List<ProductData> searchedProducts,
    @Default('') String query,
    @Default(ListAlignment.vertically) ListAlignment listAlignment,
  }) = _NewProductsState;

  const NewProductsState._();
}