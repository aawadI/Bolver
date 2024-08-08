// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../models/models.dart' as _i9;
import '../../presentation/pages/initial/ui_type/ui_type_page.dart' as _i4;
import '../../presentation/pages/main/main_page.dart' as _i2;
import '../../presentation/pages/main/profile/add_address/add_address_page.dart'
    as _i3;
import '../../presentation/pages/main/shop_list/shop_list_home_page/shop_list_v2_page.dart'
    as _i5;
import '../../presentation/pages/main/view_map/view_map_page.dart' as _i6;
import '../../presentation/pages/pages.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    NoConnectionRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.NoConnectionPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideTop,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SelectLanguageRoute.name: (routeData) {
      final args = routeData.argsAs<SelectLanguageRouteArgs>(
          orElse: () => const SelectLanguageRouteArgs());
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.SelectLanguagePage(
          key: args.key,
          isRequired: args.isRequired,
        ),
        transitionsBuilder: _i7.TransitionsBuilders.slideTop,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EnterPhoneRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.EnterPhonePage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ResetPasswordPage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ResetConfirmationRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ResetConfirmationPage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NewPasswordRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.NewPasswordPage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterConfirmationRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.RegisterConfirmationPage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ShopMainRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ShopMainPage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MainRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideLeftWithFade,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.ProductPage(
          key: args.key,
          uuid: args.uuid,
        ),
      );
    },
    BrandDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BrandDetailsRouteArgs>();
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.BrandDetailsPage(
          key: args.key,
          brand: args.brand,
        ),
      );
    },
    BrandsRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.BrandsPage(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.NotificationsPage(),
      );
    },
    SavedStoresRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SavedStoresPage(),
      );
    },
    ViewedProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ViewedProductsRouteArgs>(
          orElse: () => const ViewedProductsRouteArgs());
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.ViewedProductsPage(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    SavedLocationsRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SavedLocationsPage(),
      );
    },
    OrderRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.OrderPage(),
      );
    },
    CheckoutRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.CheckoutPage(),
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.OrderHistoryPage(),
      );
    },
    CategoryProductsRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryProductsRouteArgs>();
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.CategoryProductsPage(
          key: args.key,
          category: args.category,
          title: args.title,
        ),
      );
    },
    ProfileSettingsRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ProfileSettingsPage(),
      );
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.OrderDetailsPage(
          key: args.key,
          orderId: args.orderId,
          date: args.date,
        ),
      );
    },
    SystemSettingsRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SystemSettingsPage(),
      );
    },
    BecomeSellerRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.BecomeSellerPage(),
      );
    },
    BlogRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.BlogPage(),
      );
    },
    BlogDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BlogDetailsRouteArgs>();
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.BlogDetailsPage(
          key: args.key,
          uuid: args.uuid,
          title: args.title,
        ),
      );
    },
    NewProductsRoute.name: (routeData) {
      final args = routeData.argsAs<NewProductsRouteArgs>(
          orElse: () => const NewProductsRouteArgs());
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.NewProductsPage(
          key: args.key,
          shopId: args.shopId,
          categoryID: args.categoryID,
          parentID: args.parentID,
          title: args.title,
        ),
      );
    },
    BannerDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BannerDetailsRouteArgs>(
          orElse: () => const BannerDetailsRouteArgs());
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.BannerDetailsPage(
          key: args.key,
          id: args.id,
          imageUrl: args.imageUrl,
        ),
      );
    },
    MostSoldProductsRoute.name: (routeData) {
      final args = routeData.argsAs<MostSoldProductsRouteArgs>(
          orElse: () => const MostSoldProductsRouteArgs());
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.MostSoldProductsPage(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    DiscountProductsRoute.name: (routeData) {
      final args = routeData.argsAs<DiscountProductsRouteArgs>(
          orElse: () => const DiscountProductsRouteArgs());
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.DiscountProductsPage(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    WalletHistoriesRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.WalletHistoriesPage(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ChatPage(),
      );
    },
    OftenBuyProductsRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.OftenBuyProductsPage(),
      );
    },
    ProfitableProductsRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ProfitableProductsPage(),
      );
    },
    SingleShopRoute.name: (routeData) {
      final args = routeData.argsAs<SingleShopRouteArgs>();
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.SingleShopPage(
          key: args.key,
          shop: args.shop,
        ),
      );
    },
    MoreCategoriesRoute.name: (routeData) {
      final args = routeData.argsAs<MoreCategoriesRouteArgs>();
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.MoreCategoriesPage(
          key: args.key,
          category: args.category,
        ),
      );
    },
    CategoryProductsFilterRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.CategoryProductsFilterPage(),
      );
    },
    FilterShopsRoute.name: (routeData) {
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.FilterShopsPage(),
      );
    },
    FilterBrandsRoute.name: (routeData) {
      final args = routeData.argsAs<FilterBrandsRouteArgs>(
          orElse: () => const FilterBrandsRouteArgs());
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.FilterBrandsPage(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    FilterExtrasRoute.name: (routeData) {
      final args = routeData.argsAs<FilterExtrasRouteArgs>();
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.FilterExtrasPage(
          key: args.key,
          extra: args.extra,
          index: args.index,
        ),
      );
    },
    AddAddressRoute.name: (routeData) {
      final args = routeData.argsAs<AddAddressRouteArgs>();
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i3.AddAddressPage(
          key: args.key,
          isRequired: args.isRequired,
          onEditID: args.onEditID,
        ),
      );
    },
    OrderSuccessRoute.name: (routeData) {
      final args = routeData.argsAs<OrderSuccessRouteArgs>(
          orElse: () => const OrderSuccessRouteArgs());
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.OrderSuccessPage(
          key: args.key,
          transactionId: args.transactionId,
        ),
      );
    },
    UiTypeRoute.name: (routeData) {
      final args = routeData.argsAs<UiTypeRouteArgs>(
          orElse: () => const UiTypeRouteArgs());
      return _i7.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i4.UiTypePage(
          key: args.key,
          isBack: args.isBack,
        ),
      );
    },
    ShopDetailsRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ShopDetailsPage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CategoriesRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.CategoriesPage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LikedRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.LikedPage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ShopListV2Route.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.ShopListV2Page(),
        transitionsBuilder: _i7.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ViewMapRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.ViewMapPage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideLeftWithFade,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SearchRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SearchPage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideLeftWithFade,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          NoConnectionRoute.name,
          path: '/no-connection',
        ),
        _i7.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i7.RouteConfig(
          SelectLanguageRoute.name,
          path: '/select-language',
        ),
        _i7.RouteConfig(
          EnterPhoneRoute.name,
          path: '/enter-phone',
        ),
        _i7.RouteConfig(
          ResetPasswordRoute.name,
          path: '/reset',
        ),
        _i7.RouteConfig(
          ResetConfirmationRoute.name,
          path: '/reset-confirmation',
        ),
        _i7.RouteConfig(
          NewPasswordRoute.name,
          path: '/new-password',
        ),
        _i7.RouteConfig(
          RegisterConfirmationRoute.name,
          path: '/register-confirmation',
        ),
        _i7.RouteConfig(
          ShopMainRoute.name,
          path: '/shop',
          children: [
            _i7.RouteConfig(
              ShopDetailsRoute.name,
              path: 'details',
              parent: ShopMainRoute.name,
            ),
            _i7.RouteConfig(
              CategoriesRoute.name,
              path: 'categories',
              parent: ShopMainRoute.name,
            ),
            _i7.RouteConfig(
              LikedRoute.name,
              path: 'liked',
              parent: ShopMainRoute.name,
            ),
          ],
        ),
        _i7.RouteConfig(
          MainRoute.name,
          path: '/main',
          children: [
            _i7.RouteConfig(
              ShopListV2Route.name,
              path: 'shop-list-v2',
              parent: MainRoute.name,
            ),
            _i7.RouteConfig(
              ViewMapRoute.name,
              path: 'view-map',
              parent: MainRoute.name,
            ),
            _i7.RouteConfig(
              SearchRoute.name,
              path: 'search',
              parent: MainRoute.name,
            ),
          ],
        ),
        _i7.RouteConfig(
          ProductRoute.name,
          path: '/product',
        ),
        _i7.RouteConfig(
          BrandDetailsRoute.name,
          path: '/brand-details',
        ),
        _i7.RouteConfig(
          BrandsRoute.name,
          path: '/brands',
        ),
        _i7.RouteConfig(
          NotificationsRoute.name,
          path: '/notifications',
        ),
        _i7.RouteConfig(
          SavedStoresRoute.name,
          path: '/saved-stores',
        ),
        _i7.RouteConfig(
          ViewedProductsRoute.name,
          path: '/viewed-products',
        ),
        _i7.RouteConfig(
          SavedLocationsRoute.name,
          path: '/saved-locations',
        ),
        _i7.RouteConfig(
          OrderRoute.name,
          path: '/order',
        ),
        _i7.RouteConfig(
          CheckoutRoute.name,
          path: '/checkout',
        ),
        _i7.RouteConfig(
          OrderHistoryRoute.name,
          path: '/order-history',
        ),
        _i7.RouteConfig(
          CategoryProductsRoute.name,
          path: '/category-products',
        ),
        _i7.RouteConfig(
          ProfileSettingsRoute.name,
          path: '/profile-settings',
        ),
        _i7.RouteConfig(
          OrderDetailsRoute.name,
          path: '/order-details',
        ),
        _i7.RouteConfig(
          SystemSettingsRoute.name,
          path: '/system-settings',
        ),
        _i7.RouteConfig(
          BecomeSellerRoute.name,
          path: '/become-seller',
        ),
        _i7.RouteConfig(
          BlogRoute.name,
          path: '/blog',
        ),
        _i7.RouteConfig(
          BlogDetailsRoute.name,
          path: '/blog-details',
        ),
        _i7.RouteConfig(
          NewProductsRoute.name,
          path: '/new-products',
        ),
        _i7.RouteConfig(
          BannerDetailsRoute.name,
          path: '/banner-details',
        ),
        _i7.RouteConfig(
          MostSoldProductsRoute.name,
          path: '/most-sold',
        ),
        _i7.RouteConfig(
          DiscountProductsRoute.name,
          path: '/discount',
        ),
        _i7.RouteConfig(
          WalletHistoriesRoute.name,
          path: '/wallet-history',
        ),
        _i7.RouteConfig(
          ChatRoute.name,
          path: '/chat',
        ),
        _i7.RouteConfig(
          OftenBuyProductsRoute.name,
          path: '/often-buy',
        ),
        _i7.RouteConfig(
          ProfitableProductsRoute.name,
          path: '/profitable',
        ),
        _i7.RouteConfig(
          SingleShopRoute.name,
          path: '/single-shop',
        ),
        _i7.RouteConfig(
          MoreCategoriesRoute.name,
          path: '/more-categories',
        ),
        _i7.RouteConfig(
          CategoryProductsFilterRoute.name,
          path: '/category-products-filter',
        ),
        _i7.RouteConfig(
          FilterShopsRoute.name,
          path: '/filter-shops',
        ),
        _i7.RouteConfig(
          FilterBrandsRoute.name,
          path: '/filter-brands',
        ),
        _i7.RouteConfig(
          FilterExtrasRoute.name,
          path: '/filter-extras',
        ),
        _i7.RouteConfig(
          AddAddressRoute.name,
          path: '/new-address',
        ),
        _i7.RouteConfig(
          OrderSuccessRoute.name,
          path: '/order-success',
        ),
        _i7.RouteConfig(
          UiTypeRoute.name,
          path: '/uiType',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i1.NoConnectionPage]
class NoConnectionRoute extends _i7.PageRouteInfo<void> {
  const NoConnectionRoute()
      : super(
          NoConnectionRoute.name,
          path: '/no-connection',
        );

  static const String name = 'NoConnectionRoute';
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i1.SelectLanguagePage]
class SelectLanguageRoute extends _i7.PageRouteInfo<SelectLanguageRouteArgs> {
  SelectLanguageRoute({
    _i8.Key? key,
    bool isRequired = false,
  }) : super(
          SelectLanguageRoute.name,
          path: '/select-language',
          args: SelectLanguageRouteArgs(
            key: key,
            isRequired: isRequired,
          ),
        );

  static const String name = 'SelectLanguageRoute';
}

class SelectLanguageRouteArgs {
  const SelectLanguageRouteArgs({
    this.key,
    this.isRequired = false,
  });

  final _i8.Key? key;

  final bool isRequired;

  @override
  String toString() {
    return 'SelectLanguageRouteArgs{key: $key, isRequired: $isRequired}';
  }
}

/// generated route for
/// [_i1.EnterPhonePage]
class EnterPhoneRoute extends _i7.PageRouteInfo<void> {
  const EnterPhoneRoute()
      : super(
          EnterPhoneRoute.name,
          path: '/enter-phone',
        );

  static const String name = 'EnterPhoneRoute';
}

/// generated route for
/// [_i1.ResetPasswordPage]
class ResetPasswordRoute extends _i7.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(
          ResetPasswordRoute.name,
          path: '/reset',
        );

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i1.ResetConfirmationPage]
class ResetConfirmationRoute extends _i7.PageRouteInfo<void> {
  const ResetConfirmationRoute()
      : super(
          ResetConfirmationRoute.name,
          path: '/reset-confirmation',
        );

  static const String name = 'ResetConfirmationRoute';
}

/// generated route for
/// [_i1.NewPasswordPage]
class NewPasswordRoute extends _i7.PageRouteInfo<void> {
  const NewPasswordRoute()
      : super(
          NewPasswordRoute.name,
          path: '/new-password',
        );

  static const String name = 'NewPasswordRoute';
}

/// generated route for
/// [_i1.RegisterConfirmationPage]
class RegisterConfirmationRoute extends _i7.PageRouteInfo<void> {
  const RegisterConfirmationRoute()
      : super(
          RegisterConfirmationRoute.name,
          path: '/register-confirmation',
        );

  static const String name = 'RegisterConfirmationRoute';
}

/// generated route for
/// [_i1.ShopMainPage]
class ShopMainRoute extends _i7.PageRouteInfo<void> {
  const ShopMainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ShopMainRoute.name,
          path: '/shop',
          initialChildren: children,
        );

  static const String name = 'ShopMainRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i1.ProductPage]
class ProductRoute extends _i7.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i8.Key? key,
    required String uuid,
  }) : super(
          ProductRoute.name,
          path: '/product',
          args: ProductRouteArgs(
            key: key,
            uuid: uuid,
          ),
        );

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.uuid,
  });

  final _i8.Key? key;

  final String uuid;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, uuid: $uuid}';
  }
}

/// generated route for
/// [_i1.BrandDetailsPage]
class BrandDetailsRoute extends _i7.PageRouteInfo<BrandDetailsRouteArgs> {
  BrandDetailsRoute({
    _i8.Key? key,
    required _i9.BrandData brand,
  }) : super(
          BrandDetailsRoute.name,
          path: '/brand-details',
          args: BrandDetailsRouteArgs(
            key: key,
            brand: brand,
          ),
        );

  static const String name = 'BrandDetailsRoute';
}

class BrandDetailsRouteArgs {
  const BrandDetailsRouteArgs({
    this.key,
    required this.brand,
  });

  final _i8.Key? key;

  final _i9.BrandData brand;

  @override
  String toString() {
    return 'BrandDetailsRouteArgs{key: $key, brand: $brand}';
  }
}

/// generated route for
/// [_i1.BrandsPage]
class BrandsRoute extends _i7.PageRouteInfo<void> {
  const BrandsRoute()
      : super(
          BrandsRoute.name,
          path: '/brands',
        );

  static const String name = 'BrandsRoute';
}

/// generated route for
/// [_i1.NotificationsPage]
class NotificationsRoute extends _i7.PageRouteInfo<void> {
  const NotificationsRoute()
      : super(
          NotificationsRoute.name,
          path: '/notifications',
        );

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i1.SavedStoresPage]
class SavedStoresRoute extends _i7.PageRouteInfo<void> {
  const SavedStoresRoute()
      : super(
          SavedStoresRoute.name,
          path: '/saved-stores',
        );

  static const String name = 'SavedStoresRoute';
}

/// generated route for
/// [_i1.ViewedProductsPage]
class ViewedProductsRoute extends _i7.PageRouteInfo<ViewedProductsRouteArgs> {
  ViewedProductsRoute({
    _i8.Key? key,
    int? shopId,
  }) : super(
          ViewedProductsRoute.name,
          path: '/viewed-products',
          args: ViewedProductsRouteArgs(
            key: key,
            shopId: shopId,
          ),
        );

  static const String name = 'ViewedProductsRoute';
}

class ViewedProductsRouteArgs {
  const ViewedProductsRouteArgs({
    this.key,
    this.shopId,
  });

  final _i8.Key? key;

  final int? shopId;

  @override
  String toString() {
    return 'ViewedProductsRouteArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.SavedLocationsPage]
class SavedLocationsRoute extends _i7.PageRouteInfo<void> {
  const SavedLocationsRoute()
      : super(
          SavedLocationsRoute.name,
          path: '/saved-locations',
        );

  static const String name = 'SavedLocationsRoute';
}

/// generated route for
/// [_i1.OrderPage]
class OrderRoute extends _i7.PageRouteInfo<void> {
  const OrderRoute()
      : super(
          OrderRoute.name,
          path: '/order',
        );

  static const String name = 'OrderRoute';
}

/// generated route for
/// [_i1.CheckoutPage]
class CheckoutRoute extends _i7.PageRouteInfo<void> {
  const CheckoutRoute()
      : super(
          CheckoutRoute.name,
          path: '/checkout',
        );

  static const String name = 'CheckoutRoute';
}

/// generated route for
/// [_i1.OrderHistoryPage]
class OrderHistoryRoute extends _i7.PageRouteInfo<void> {
  const OrderHistoryRoute()
      : super(
          OrderHistoryRoute.name,
          path: '/order-history',
        );

  static const String name = 'OrderHistoryRoute';
}

/// generated route for
/// [_i1.CategoryProductsPage]
class CategoryProductsRoute
    extends _i7.PageRouteInfo<CategoryProductsRouteArgs> {
  CategoryProductsRoute({
    _i8.Key? key,
    _i9.CategoryData? category,
    required String title,
  }) : super(
          CategoryProductsRoute.name,
          path: '/category-products',
          args: CategoryProductsRouteArgs(
            key: key,
            category: category,
            title: title,
          ),
        );

  static const String name = 'CategoryProductsRoute';
}

class CategoryProductsRouteArgs {
  const CategoryProductsRouteArgs({
    this.key,
    this.category,
    required this.title,
  });

  final _i8.Key? key;

  final _i9.CategoryData? category;

  final String title;

  @override
  String toString() {
    return 'CategoryProductsRouteArgs{key: $key, category: $category, title: $title}';
  }
}

/// generated route for
/// [_i1.ProfileSettingsPage]
class ProfileSettingsRoute extends _i7.PageRouteInfo<void> {
  const ProfileSettingsRoute()
      : super(
          ProfileSettingsRoute.name,
          path: '/profile-settings',
        );

  static const String name = 'ProfileSettingsRoute';
}

/// generated route for
/// [_i1.OrderDetailsPage]
class OrderDetailsRoute extends _i7.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    _i8.Key? key,
    required int orderId,
    required String date,
  }) : super(
          OrderDetailsRoute.name,
          path: '/order-details',
          args: OrderDetailsRouteArgs(
            key: key,
            orderId: orderId,
            date: date,
          ),
        );

  static const String name = 'OrderDetailsRoute';
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({
    this.key,
    required this.orderId,
    required this.date,
  });

  final _i8.Key? key;

  final int orderId;

  final String date;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{key: $key, orderId: $orderId, date: $date}';
  }
}

/// generated route for
/// [_i1.SystemSettingsPage]
class SystemSettingsRoute extends _i7.PageRouteInfo<void> {
  const SystemSettingsRoute()
      : super(
          SystemSettingsRoute.name,
          path: '/system-settings',
        );

  static const String name = 'SystemSettingsRoute';
}

/// generated route for
/// [_i1.BecomeSellerPage]
class BecomeSellerRoute extends _i7.PageRouteInfo<void> {
  const BecomeSellerRoute()
      : super(
          BecomeSellerRoute.name,
          path: '/become-seller',
        );

  static const String name = 'BecomeSellerRoute';
}

/// generated route for
/// [_i1.BlogPage]
class BlogRoute extends _i7.PageRouteInfo<void> {
  const BlogRoute()
      : super(
          BlogRoute.name,
          path: '/blog',
        );

  static const String name = 'BlogRoute';
}

/// generated route for
/// [_i1.BlogDetailsPage]
class BlogDetailsRoute extends _i7.PageRouteInfo<BlogDetailsRouteArgs> {
  BlogDetailsRoute({
    _i8.Key? key,
    required String uuid,
    required String title,
  }) : super(
          BlogDetailsRoute.name,
          path: '/blog-details',
          args: BlogDetailsRouteArgs(
            key: key,
            uuid: uuid,
            title: title,
          ),
        );

  static const String name = 'BlogDetailsRoute';
}

class BlogDetailsRouteArgs {
  const BlogDetailsRouteArgs({
    this.key,
    required this.uuid,
    required this.title,
  });

  final _i8.Key? key;

  final String uuid;

  final String title;

  @override
  String toString() {
    return 'BlogDetailsRouteArgs{key: $key, uuid: $uuid, title: $title}';
  }
}

/// generated route for
/// [_i1.NewProductsPage]
class NewProductsRoute extends _i7.PageRouteInfo<NewProductsRouteArgs> {
  NewProductsRoute({
    _i8.Key? key,
    int? shopId,
    int? categoryID,
    int? parentID,
    String? title,
  }) : super(
          NewProductsRoute.name,
          path: '/new-products',
          args: NewProductsRouteArgs(
            key: key,
            shopId: shopId,
            categoryID: categoryID,
            parentID: parentID,
            title: title,
          ),
        );

  static const String name = 'NewProductsRoute';
}

class NewProductsRouteArgs {
  const NewProductsRouteArgs({
    this.key,
    this.shopId,
    this.categoryID,
    this.parentID,
    this.title,
  });

  final _i8.Key? key;

  final int? shopId;

  final int? categoryID;

  final int? parentID;

  final String? title;

  @override
  String toString() {
    return 'NewProductsRouteArgs{key: $key, shopId: $shopId, categoryID: $categoryID, parentID: $parentID, title: $title}';
  }
}

/// generated route for
/// [_i1.BannerDetailsPage]
class BannerDetailsRoute extends _i7.PageRouteInfo<BannerDetailsRouteArgs> {
  BannerDetailsRoute({
    _i8.Key? key,
    int? id,
    String? imageUrl,
  }) : super(
          BannerDetailsRoute.name,
          path: '/banner-details',
          args: BannerDetailsRouteArgs(
            key: key,
            id: id,
            imageUrl: imageUrl,
          ),
        );

  static const String name = 'BannerDetailsRoute';
}

class BannerDetailsRouteArgs {
  const BannerDetailsRouteArgs({
    this.key,
    this.id,
    this.imageUrl,
  });

  final _i8.Key? key;

  final int? id;

  final String? imageUrl;

  @override
  String toString() {
    return 'BannerDetailsRouteArgs{key: $key, id: $id, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [_i1.MostSoldProductsPage]
class MostSoldProductsRoute
    extends _i7.PageRouteInfo<MostSoldProductsRouteArgs> {
  MostSoldProductsRoute({
    _i8.Key? key,
    int? shopId,
  }) : super(
          MostSoldProductsRoute.name,
          path: '/most-sold',
          args: MostSoldProductsRouteArgs(
            key: key,
            shopId: shopId,
          ),
        );

  static const String name = 'MostSoldProductsRoute';
}

class MostSoldProductsRouteArgs {
  const MostSoldProductsRouteArgs({
    this.key,
    this.shopId,
  });

  final _i8.Key? key;

  final int? shopId;

  @override
  String toString() {
    return 'MostSoldProductsRouteArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.DiscountProductsPage]
class DiscountProductsRoute
    extends _i7.PageRouteInfo<DiscountProductsRouteArgs> {
  DiscountProductsRoute({
    _i8.Key? key,
    int? shopId,
  }) : super(
          DiscountProductsRoute.name,
          path: '/discount',
          args: DiscountProductsRouteArgs(
            key: key,
            shopId: shopId,
          ),
        );

  static const String name = 'DiscountProductsRoute';
}

class DiscountProductsRouteArgs {
  const DiscountProductsRouteArgs({
    this.key,
    this.shopId,
  });

  final _i8.Key? key;

  final int? shopId;

  @override
  String toString() {
    return 'DiscountProductsRouteArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.WalletHistoriesPage]
class WalletHistoriesRoute extends _i7.PageRouteInfo<void> {
  const WalletHistoriesRoute()
      : super(
          WalletHistoriesRoute.name,
          path: '/wallet-history',
        );

  static const String name = 'WalletHistoriesRoute';
}

/// generated route for
/// [_i1.ChatPage]
class ChatRoute extends _i7.PageRouteInfo<void> {
  const ChatRoute()
      : super(
          ChatRoute.name,
          path: '/chat',
        );

  static const String name = 'ChatRoute';
}

/// generated route for
/// [_i1.OftenBuyProductsPage]
class OftenBuyProductsRoute extends _i7.PageRouteInfo<void> {
  const OftenBuyProductsRoute()
      : super(
          OftenBuyProductsRoute.name,
          path: '/often-buy',
        );

  static const String name = 'OftenBuyProductsRoute';
}

/// generated route for
/// [_i1.ProfitableProductsPage]
class ProfitableProductsRoute extends _i7.PageRouteInfo<void> {
  const ProfitableProductsRoute()
      : super(
          ProfitableProductsRoute.name,
          path: '/profitable',
        );

  static const String name = 'ProfitableProductsRoute';
}

/// generated route for
/// [_i1.SingleShopPage]
class SingleShopRoute extends _i7.PageRouteInfo<SingleShopRouteArgs> {
  SingleShopRoute({
    _i8.Key? key,
    required _i9.ShopData? shop,
  }) : super(
          SingleShopRoute.name,
          path: '/single-shop',
          args: SingleShopRouteArgs(
            key: key,
            shop: shop,
          ),
        );

  static const String name = 'SingleShopRoute';
}

class SingleShopRouteArgs {
  const SingleShopRouteArgs({
    this.key,
    required this.shop,
  });

  final _i8.Key? key;

  final _i9.ShopData? shop;

  @override
  String toString() {
    return 'SingleShopRouteArgs{key: $key, shop: $shop}';
  }
}

/// generated route for
/// [_i1.MoreCategoriesPage]
class MoreCategoriesRoute extends _i7.PageRouteInfo<MoreCategoriesRouteArgs> {
  MoreCategoriesRoute({
    _i8.Key? key,
    required _i9.CategoryData category,
  }) : super(
          MoreCategoriesRoute.name,
          path: '/more-categories',
          args: MoreCategoriesRouteArgs(
            key: key,
            category: category,
          ),
        );

  static const String name = 'MoreCategoriesRoute';
}

class MoreCategoriesRouteArgs {
  const MoreCategoriesRouteArgs({
    this.key,
    required this.category,
  });

  final _i8.Key? key;

  final _i9.CategoryData category;

  @override
  String toString() {
    return 'MoreCategoriesRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i1.CategoryProductsFilterPage]
class CategoryProductsFilterRoute extends _i7.PageRouteInfo<void> {
  const CategoryProductsFilterRoute()
      : super(
          CategoryProductsFilterRoute.name,
          path: '/category-products-filter',
        );

  static const String name = 'CategoryProductsFilterRoute';
}

/// generated route for
/// [_i1.FilterShopsPage]
class FilterShopsRoute extends _i7.PageRouteInfo<void> {
  const FilterShopsRoute()
      : super(
          FilterShopsRoute.name,
          path: '/filter-shops',
        );

  static const String name = 'FilterShopsRoute';
}

/// generated route for
/// [_i1.FilterBrandsPage]
class FilterBrandsRoute extends _i7.PageRouteInfo<FilterBrandsRouteArgs> {
  FilterBrandsRoute({
    _i8.Key? key,
    int? shopId,
  }) : super(
          FilterBrandsRoute.name,
          path: '/filter-brands',
          args: FilterBrandsRouteArgs(
            key: key,
            shopId: shopId,
          ),
        );

  static const String name = 'FilterBrandsRoute';
}

class FilterBrandsRouteArgs {
  const FilterBrandsRouteArgs({
    this.key,
    this.shopId,
  });

  final _i8.Key? key;

  final int? shopId;

  @override
  String toString() {
    return 'FilterBrandsRouteArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.FilterExtrasPage]
class FilterExtrasRoute extends _i7.PageRouteInfo<FilterExtrasRouteArgs> {
  FilterExtrasRoute({
    _i8.Key? key,
    required _i9.ExtraGroup? extra,
    required int index,
  }) : super(
          FilterExtrasRoute.name,
          path: '/filter-extras',
          args: FilterExtrasRouteArgs(
            key: key,
            extra: extra,
            index: index,
          ),
        );

  static const String name = 'FilterExtrasRoute';
}

class FilterExtrasRouteArgs {
  const FilterExtrasRouteArgs({
    this.key,
    required this.extra,
    required this.index,
  });

  final _i8.Key? key;

  final _i9.ExtraGroup? extra;

  final int index;

  @override
  String toString() {
    return 'FilterExtrasRouteArgs{key: $key, extra: $extra, index: $index}';
  }
}

/// generated route for
/// [_i3.AddAddressPage]
class AddAddressRoute extends _i7.PageRouteInfo<AddAddressRouteArgs> {
  AddAddressRoute({
    _i8.Key? key,
    required bool isRequired,
    int? onEditID,
  }) : super(
          AddAddressRoute.name,
          path: '/new-address',
          args: AddAddressRouteArgs(
            key: key,
            isRequired: isRequired,
            onEditID: onEditID,
          ),
        );

  static const String name = 'AddAddressRoute';
}

class AddAddressRouteArgs {
  const AddAddressRouteArgs({
    this.key,
    required this.isRequired,
    this.onEditID,
  });

  final _i8.Key? key;

  final bool isRequired;

  final int? onEditID;

  @override
  String toString() {
    return 'AddAddressRouteArgs{key: $key, isRequired: $isRequired, onEditID: $onEditID}';
  }
}

/// generated route for
/// [_i1.OrderSuccessPage]
class OrderSuccessRoute extends _i7.PageRouteInfo<OrderSuccessRouteArgs> {
  OrderSuccessRoute({
    _i8.Key? key,
    int? transactionId,
  }) : super(
          OrderSuccessRoute.name,
          path: '/order-success',
          args: OrderSuccessRouteArgs(
            key: key,
            transactionId: transactionId,
          ),
        );

  static const String name = 'OrderSuccessRoute';
}

class OrderSuccessRouteArgs {
  const OrderSuccessRouteArgs({
    this.key,
    this.transactionId,
  });

  final _i8.Key? key;

  final int? transactionId;

  @override
  String toString() {
    return 'OrderSuccessRouteArgs{key: $key, transactionId: $transactionId}';
  }
}

/// generated route for
/// [_i4.UiTypePage]
class UiTypeRoute extends _i7.PageRouteInfo<UiTypeRouteArgs> {
  UiTypeRoute({
    _i8.Key? key,
    bool isBack = false,
  }) : super(
          UiTypeRoute.name,
          path: '/uiType',
          args: UiTypeRouteArgs(
            key: key,
            isBack: isBack,
          ),
        );

  static const String name = 'UiTypeRoute';
}

class UiTypeRouteArgs {
  const UiTypeRouteArgs({
    this.key,
    this.isBack = false,
  });

  final _i8.Key? key;

  final bool isBack;

  @override
  String toString() {
    return 'UiTypeRouteArgs{key: $key, isBack: $isBack}';
  }
}

/// generated route for
/// [_i1.ShopDetailsPage]
class ShopDetailsRoute extends _i7.PageRouteInfo<void> {
  const ShopDetailsRoute()
      : super(
          ShopDetailsRoute.name,
          path: 'details',
        );

  static const String name = 'ShopDetailsRoute';
}

/// generated route for
/// [_i1.CategoriesPage]
class CategoriesRoute extends _i7.PageRouteInfo<void> {
  const CategoriesRoute()
      : super(
          CategoriesRoute.name,
          path: 'categories',
        );

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i1.LikedPage]
class LikedRoute extends _i7.PageRouteInfo<void> {
  const LikedRoute()
      : super(
          LikedRoute.name,
          path: 'liked',
        );

  static const String name = 'LikedRoute';
}

/// generated route for
/// [_i5.ShopListV2Page]
class ShopListV2Route extends _i7.PageRouteInfo<void> {
  const ShopListV2Route()
      : super(
          ShopListV2Route.name,
          path: 'shop-list-v2',
        );

  static const String name = 'ShopListV2Route';
}

/// generated route for
/// [_i6.ViewMapPage]
class ViewMapRoute extends _i7.PageRouteInfo<void> {
  const ViewMapRoute()
      : super(
          ViewMapRoute.name,
          path: 'view-map',
        );

  static const String name = 'ViewMapRoute';
}

/// generated route for
/// [_i1.SearchPage]
class SearchRoute extends _i7.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: 'search',
        );

  static const String name = 'SearchRoute';
}
