import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'home_banners_state.freezed.dart';

@freezed
class HomeBannersState with _$HomeBannersState {
  const factory HomeBannersState({
    @Default(false) bool isLoading,
    @Default([]) List<BannerData> banners,
    @Default(0) int bannerIndex,
  }) = _HomeBannersState;

  const HomeBannersState._();
}