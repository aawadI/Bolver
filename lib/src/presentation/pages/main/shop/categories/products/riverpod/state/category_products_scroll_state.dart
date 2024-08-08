import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_products_scroll_state.freezed.dart';

@freezed
class CategoryProductsScrollState with _$CategoryProductsScrollState {
  const factory CategoryProductsScrollState({@Default(false) bool isVisible}) =
      _CategoryProductsScrollStatee;

  const CategoryProductsScrollState._();
}
