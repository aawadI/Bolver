import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';
import '../../../../../../../core/constants/constants.dart';

part 'liked_state.freezed.dart';

@freezed
class LikedState with _$LikedState {
  const factory LikedState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isLikedProductsLoading,
    @Default('') String query,
    @Default([]) List<ProductData> searchedProducts,
    @Default([]) List<ProductData> likedProducts,
    @Default(ListAlignment.vertically) ListAlignment listAlignment,
  }) = _LikedState;

  const LikedState._();
}