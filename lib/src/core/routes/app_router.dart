import 'package:auto_route/auto_route.dart';
import 'package:g_customer/src/presentation/pages/main/view_map/view_map_page.dart';

import '../../presentation/pages/initial/ui_type/ui_type_page.dart';
import '../../presentation/pages/main/main_page.dart';
import '../../presentation/pages/main/profile/add_address/add_address_page.dart';
import '../../presentation/pages/main/shop_list/shop_list_home_page/shop_list_v2_page.dart';
import '../../presentation/pages/pages.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    CupertinoRoute(path: '/', page: SplashPage),
    CupertinoRoute(path: '/no-connection', page: NoConnectionPage),
    CustomRoute(
      path: '/login',
      page: LoginPage,
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      path: '/select-language',
      page: SelectLanguagePage,
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      path: '/enter-phone',
      page: EnterPhonePage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      path: '/reset',
      page: ResetPasswordPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      path: '/reset-confirmation',
      page: ResetConfirmationPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      path: '/new-password',
      page: NewPasswordPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      path: '/register-confirmation',
      page: RegisterConfirmationPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 500,
    ),
    CustomRoute(
      path: '/shop',
      page: ShopMainPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 500,
      children: [
        CustomRoute(
          path: 'details',
          page: ShopDetailsPage,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          path: 'categories',
          page: CategoriesPage,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          path: 'liked',
          page: LikedPage,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 300,
        ),
      ],
    ),
    CustomRoute(
      path: '/main',
      page: MainPage,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      durationInMilliseconds: 500,
      children: [
        CustomRoute(
          path: 'shop-list-v2',
          page: ShopListV2Page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          path: 'view-map',
          page: ViewMapPage,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 300,
        ),
        CustomRoute(
          path: 'search',
          page: SearchPage,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 300,
        ),
      ],
    ),
    CupertinoRoute(path: '/product', page: ProductPage),
    CupertinoRoute(path: '/brand-details', page: BrandDetailsPage),
    CupertinoRoute(path: '/brands', page: BrandsPage),
    CupertinoRoute(path: '/notifications', page: NotificationsPage),
    CupertinoRoute(path: '/saved-stores', page: SavedStoresPage),
    CupertinoRoute(path: '/viewed-products', page: ViewedProductsPage),
    CupertinoRoute(path: '/saved-locations', page: SavedLocationsPage),
    CupertinoRoute(path: '/order', page: OrderPage),
    CupertinoRoute(path: '/checkout', page: CheckoutPage),
    CupertinoRoute(path: '/order-history', page: OrderHistoryPage),
    CupertinoRoute(path: '/category-products', page: CategoryProductsPage),
    CupertinoRoute(path: '/profile-settings', page: ProfileSettingsPage),
    CupertinoRoute(path: '/order-details', page: OrderDetailsPage),
    CupertinoRoute(path: '/system-settings', page: SystemSettingsPage),
    CupertinoRoute(path: '/become-seller', page: BecomeSellerPage),
    CupertinoRoute(path: '/blog', page: BlogPage),
    CupertinoRoute(path: '/blog-details', page: BlogDetailsPage),
    CupertinoRoute(path: '/new-products', page: NewProductsPage),
    CupertinoRoute(path: '/banner-details', page: BannerDetailsPage),
    CupertinoRoute(path: '/most-sold', page: MostSoldProductsPage),
    CupertinoRoute(path: '/discount', page: DiscountProductsPage),
    CupertinoRoute(path: '/wallet-history', page: WalletHistoriesPage),
    CupertinoRoute(path: '/chat', page: ChatPage),
    CupertinoRoute(path: '/often-buy', page: OftenBuyProductsPage),
    CupertinoRoute(path: '/profitable', page: ProfitableProductsPage),
    CupertinoRoute(path: '/single-shop', page: SingleShopPage),
    CupertinoRoute(path: '/more-categories', page: MoreCategoriesPage),
    CupertinoRoute(
      path: '/category-products-filter',
      page: CategoryProductsFilterPage,
    ),
    CupertinoRoute(path: '/filter-shops', page: FilterShopsPage),
    CupertinoRoute(path: '/filter-brands', page: FilterBrandsPage),
    CupertinoRoute(path: '/filter-extras', page: FilterExtrasPage),
    CupertinoRoute(path: '/new-address', page: AddAddressPage),
    CupertinoRoute(path: '/order-success', page: OrderSuccessPage),
    CupertinoRoute(path: '/uiType', page: UiTypePage),
  ],
)
class $AppRouter {}
