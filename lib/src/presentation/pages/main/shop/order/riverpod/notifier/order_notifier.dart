import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../repository/repository.dart';
import '../../checkout/riverpod/notifier/checkout_notifier.dart';
import '../state/order_state.dart';

class OrderNotifier extends StateNotifier<OrderState> {
  final ShopsRepository _shopsRepository;
  final ProductsRepository _productsRepository;

  OrderNotifier(this._shopsRepository, this._productsRepository)
      : super(const OrderState());

  Future<void> fetchShops(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      final List<SettingsData> settings =
          LocalStorage.instance.getSettingsList();
      bool isDelivery = false;
      for (final setting in settings) {
        if (setting.key == 'delivery') {
          isDelivery = setting.value == '0';
          break;
        }
      }
      final List<CartProductData> cartProducts =
          LocalStorage.instance.getCartProducts();
      List<int> shopIds = [];
      for (final product in cartProducts) {
        shopIds.add(product.selectedStock?.product?.shopId ?? 0);
      }
      shopIds = shopIds.toSet().toList();
      if (shopIds.isEmpty) {
        state = state.copyWith(isLoading: false);
        return;
      }
      if (isDelivery) {
        final response = await _shopsRepository.getShopsByIds(shopIds);
        response.when(
          success: (data) {
            debugPrint("fetchShops : ${data.data!.length}");
            state = state.copyWith(shops: data.data ?? [], isLoading: false);
            updateShops();
          },
          failure: (failure) {
            state = state.copyWith(isLoading: false);
            if (failure == const NetworkExceptions.noInternetConnection()) {
              AppHelpers.showCheckFlash(context, 'No internet connection');
            }
            debugPrint('==> get all shops failure: $failure');
          },
        );
      } else {
        /// getting shop ids for getting shop deliveries
        final response = await _shopsRepository.getShopsDeliveries(shopIds);
        response.when(
          success: (data) async {
            state = state.copyWith(shops: data.data ?? [], isLoading: false);
            updateShops();
          },
          failure: (failure) {
            state = state.copyWith(isLoading: false);
            if (failure == const NetworkExceptions.noInternetConnection()) {
              AppHelpers.showCheckFlash(
                context,
                AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
              );
            }
            debugPrint('==> get all shops failure: $failure');
          },
        );
      }
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }


  void updateShops() {
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    List<ShopData> selectedShops = [];
    debugPrint('get cart products :');
    for (CartProductData product in cartProducts) {
      debugPrint("cartProducts.id : ${product.selectedStock?.product?.shopId}");
      debugPrint("ShopData.length : ${state.shops.length}");

      for (ShopData shop in state.shops) {
        debugPrint("ShopData.id : ${shop.id}");
        debugPrint("state ShopData.ID : ${product.selectedStock?.product?.id}");
        debugPrint("ShopData.ID : ${shop.id}");
        // if (shop.id == product.selectedStock?.product?.shopId) {
        //   selectedShops.add(shop);
        // }
        selectedShops.add(shop);
      }
    }
    debugPrint("selectedShops.length : ");
    debugPrint('$selectedShops');
    state = state.copyWith(shops: selectedShops.toSet().toList());
    calculateShopTotals();
  }

  void calculateShopTotals() {
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    List<CartProductData> filterProducts = [];
    List shops = [];
    List<ShopTotalData> shopTotals = [];
    double totalProductPrice = 0;
    double totalDiscount = 0;
    double totalProductsTax = 0;
    double totalShopsTax = 0;
    double productTax = 0;
    double onlyShopTax = 0;
    double shopDiscount = 0;
    double shopTotal = 0;
    for (var element in cartProducts) {
     shops.add(element.shopID);
    }
    shops = shops.toSet().toList();
    for (int i = 0; i < shops.length; i++) {
      for (final CartProductData product in cartProducts) {

        if(product.shopID == shops[i]) {
          filterProducts.add(product);
        final bool hasDiscount = product.selectedStock?.discount != null &&
            (product.selectedStock?.discount ?? 0) > 0;
        final productPrice = hasDiscount
            ? ((product.selectedStock?.price ?? 0) -
                (product.selectedStock?.discount ?? 0))
            : product.selectedStock?.price;
        productTax += (((productPrice ?? 0) * (1)) / 100 +
                (product.selectedStock?.tax ?? 0)) *
            (product.quantity ?? 1);
        onlyShopTax += (((productPrice ?? 0) * (1)) / 100) *
            (product.quantity ?? 1);
        shopDiscount += hasDiscount
            ? ((product.selectedStock?.discount ?? 0) * (product.quantity ?? 1))
            : 0;
        shopTotal += (productPrice ?? 0) * (product.quantity ?? 1);
        totalProductPrice += shopTotal;
        totalProductsTax += productTax;
        totalShopsTax += onlyShopTax;
        }
      }

      shopTotals.add(
        ShopTotalData(
          state.shops[i],
          shopTax: productTax,
          onlyShopTax: onlyShopTax,
          discount: shopDiscount,
          totalPrice: shopTotal + productTax,
          cartProducts: filterProducts,
        ),
      );

      totalDiscount += shopDiscount;
      filterProducts = [];
      shopTotal = 0;
      productTax = 0;
      onlyShopTax = 0;
      shopDiscount = 0;
    }
    state = state.copyWith(
      shopTotals: shopTotals,
      totalProductPrice: totalProductPrice,
      totalDiscount: totalDiscount,
      totalProductsTax: totalProductsTax,
      totalShopsTax: totalShopsTax,
      totalAmount:
          totalProductPrice + totalProductsTax + totalShopsTax,
    );
  }

  void setCoupon(num couponValue, CouponType couponType) {
    num couponPrice = state.coupon;
    final List<CartProductData> cartProducts =
    LocalStorage.instance.getCartProducts();
    List<CartProductData> filterProducts = [];
    List shops = [];
    List<ShopTotalData> shopTotals = [];
    double totalProductPrice = 0;
    double totalDiscount = 0;
    double totalProductsTax = 0;
    double totalShopsTax = 0;
    double productTax = 0;
    double onlyShopTax = 0;
    double shopDiscount = 0;
    double shopTotal = 0;
    for (var element in cartProducts) {
      shops.add(element.shopID);
    }
    shops = shops.toSet().toList();
    for (int i = 0; i < shops.length; i++) {
      for (final CartProductData product in cartProducts) {
        if(product.shopID == shops[i]) {
          filterProducts.add(product);
          final bool hasDiscount = product.selectedStock?.discount != null &&
              (product.selectedStock?.discount ?? 0) > 0;
          final productPrice = hasDiscount
              ? ((product.selectedStock?.price ?? 0) -
              (product.selectedStock?.discount ?? 0))
              : product.selectedStock?.price;
          productTax += (((productPrice ?? 0) * (1)) / 100 +
              (product.selectedStock?.tax ?? 0)) *
              (product.quantity ?? 1);
          onlyShopTax += (((productPrice ?? 0) * (1)) / 100) *
              (product.quantity ?? 1);
          shopDiscount += hasDiscount
              ? ((product.selectedStock?.discount ?? 0) * (product.quantity ?? 1))
              : 0;
          shopTotal += (productPrice ?? 0) * (product.quantity ?? 1);
          totalProductPrice += shopTotal;
          totalProductsTax += productTax;
          totalShopsTax += onlyShopTax;
        }
      }
      couponPrice = couponType == CouponType.fix
          ? couponValue
          : (shopTotal * couponValue / 100);
      shopTotals.add(
        ShopTotalData(
          state.shops[i],
          shopTax: productTax,
          onlyShopTax: onlyShopTax,
          discount: shopDiscount,
          totalPrice: shopTotal + productTax,
          cartProducts: filterProducts,
        ),
      );

      totalDiscount += shopDiscount;
      filterProducts = [];
      shopTotal = 0;
      productTax = 0;
      onlyShopTax = 0;
      shopDiscount = 0;
    }
    state = state.copyWith(
      shopTotals: shopTotals,
      totalProductPrice: totalProductPrice,
      totalDiscount: totalDiscount,
      totalProductsTax: totalProductsTax,
      totalShopsTax: totalShopsTax,
      coupon: couponPrice.toDouble(),
      totalAmount: totalProductPrice +
          totalProductsTax +
          totalShopsTax -
          couponPrice,
    );
  }

  List<CartProductData> getShopProducts(int shopId) {
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    List<CartProductData> products = [];
    for (CartProductData product in cartProducts) {
      if (shopId == product.selectedStock?.product?.shopId) {
        products.add(product);
      }
    }
    return products;
  }

  void deleteAllCartProducts() {
    LocalStorage.instance.deleteCartProducts();
    state = state.copyWith(shopTotals: [], shops: []);
  }

  void deleteProduct(CartProductData productData) {
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    int? index;
    for (int i = 0; i < cartProducts.length; i++) {
      if (productData.selectedStock?.product?.id ==
          cartProducts[i].selectedStock?.product?.id) {
        index = i;
        break;
      }
    }
    if (index != null) {
      cartProducts.removeAt(index);
    }
    LocalStorage.instance.setCartProducts(cartProducts);
    updateShops();
  }

  void decreaseProductCount(CartProductData productData) {
    if ((productData.quantity ?? 0) < 2 ||
        ((productData.quantity ?? 0) <=
            (productData.selectedStock?.product?.minQty ?? 0))) {
      return;
    }
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    int? index;
    for (int i = 0; i < cartProducts.length; i++) {
      if (productData.selectedStock?.product?.id ==
          cartProducts[i].selectedStock?.product?.id) {
        index = i;
        break;
      }
    }
    if (index != null) {
      cartProducts[index] = productData.copyWith(
        quantity: (productData.quantity ?? 0) - 1,
      );
    }
    LocalStorage.instance.setCartProducts(cartProducts);
    updateShops();
  }

  void increaseProductCount(CartProductData productData) {
    if ((productData.quantity ?? 0) >=
        (productData.selectedStock?.product?.maxQty ?? 10000)) {
      return;
    }
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    int? index;
    for (int i = 0; i < cartProducts.length; i++) {
      if (productData.selectedStock?.id == cartProducts[i].selectedStock?.id) {
        index = i;
        break;
      }
    }
    if (index != null) {
      cartProducts[index] = productData.copyWith(
        quantity: (productData.quantity ?? 0) + 1,
      );
    }


    LocalStorage.instance.setCartProducts(cartProducts);
    updateShops();
  }

  void checkProducts() {
    final List<CartProductData> cartProducts =
        LocalStorage.instance.getCartProducts();
    final List<CalculatedProduct> calculatedStocks =
        state.calculateResponse?.data?.products ?? [];
    for (int i = 0; i < cartProducts.length; i++) {
      bool hasProduct = false;
      int productIndex = 0;
      for (final stock in calculatedStocks) {
        if (stock.id == cartProducts[i].selectedStock?.id) {
          hasProduct = true;
          productIndex = i;
          break;
        }
      }
      if (!hasProduct) {
        cartProducts.removeAt(productIndex);
      }
    }
    for (int i = 0; i < cartProducts.length; i++) {
      for (final calculatedStock in calculatedStocks) {
        if (cartProducts[i].selectedStock?.id == calculatedStock.id) {
          final Stocks updatedStock = cartProducts[i].selectedStock!.copyWith(
                tax: (calculatedStock.tax ?? 0) / (calculatedStock.qty ?? 1),
                price: calculatedStock.price,
                discount: (calculatedStock.discount ?? 0) /
                    (calculatedStock.qty ?? 1),
              );
          cartProducts[i] = cartProducts[i].copyWith(
            selectedStock: updatedStock,
            quantity: calculatedStock.qty,
          );
        }
      }
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
      likedProducts.insert(0, productId ?? 0);
    }
    LocalStorage.instance.setLikedProductsList(likedProducts.toSet().toList());
    state = state.copyWith();
  }

  Future<void> fetchAllShops(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _shopsRepository.getAllShops();
      response.when(
        success: (data) async {
          state = state.copyWith(
            allShops: data.data ?? [],
            isLoading: false,
          );
        },
        failure: (activeFailure) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> get shops failure: $activeFailure');
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

  Future<void> getCalculations(
      BuildContext context, {
        CheckoutNotifier? checkoutNotifier,
      }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(
        isLoading: true,
        isCalculateLoading: true,
        shops: [],
        //allShops: [],
        shopTotals: [],
        coupon: 0,
      );
      final List<CartProductData> cartProducts =
      LocalStorage.instance.getCartProducts();
      if (cartProducts.isEmpty) {
        state = state.copyWith(isLoading: false, isCalculateLoading: false);
        return;
      }
      final response =
      await _productsRepository.getAllCalculations(cartProducts);
      response.when(
        success: (data) async {
          await fetchShops(context);
          state = state.copyWith(calculateResponse: data, isLoading: false, isCalculateLoading: false);
          checkProducts();
          if (checkoutNotifier != null) {
            // ignore: use_build_context_synchronously
            checkoutNotifier.checkCashback(
                context, (data.data?.orderTotal ?? 0).toDouble());
          }
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false, isCalculateLoading: false);
          debugPrint('==> get calculations failure: $failure');
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
