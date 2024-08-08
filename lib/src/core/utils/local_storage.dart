import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/models.dart';
import '../constants/constants.dart';

class LocalStorage {
  static SharedPreferences? _preferences;

  LocalStorage._();

  static LocalStorage? _localStorage;

  static LocalStorage instance = LocalStorage._();

  static Future<LocalStorage> getInstance() async {
    if (_localStorage == null) {
      _localStorage = LocalStorage._();
      await _localStorage!._init();
    }
    return _localStorage!;
  }

  static Future<SharedPreferences> getSharedPreferences() async {
    if (_preferences == null) {
      _localStorage = LocalStorage._();
      await _localStorage!._init();
    }
    return _preferences!;
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setLangSelected(bool selected) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangSelected, selected);
    }
  }

  bool getLangSelected() =>
      _preferences?.getBool(AppConstants.keyLangSelected) ?? false;

  Future<void> setUser(UserData? user) async {
    if (_preferences != null) {
      final String userString = user != null ? jsonEncode(user.toJson()) : '';
      await _preferences!.setString(AppConstants.keyUser, userString);
    }
  }

  UserData? getUser() {
    final savedString = _preferences?.getString(AppConstants.keyUser);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return UserData.fromJson(map);
  }


  static Future<void> setUiType(int type) async {
    if (_preferences != null) {
      await _preferences!.setInt(AppConstants.keyUiType, type);
    }
  }

  static int? getUiType() => _preferences?.getInt(AppConstants.keyUiType);

  void _deleteUser() => _preferences?.remove(AppConstants.keyUser);

  Future<void> setToken(String? token) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyToken, token ?? '');
    }
  }

  String getToken() => _preferences?.getString(AppConstants.keyToken) ?? '';

  void deleteToken() => _preferences?.remove(AppConstants.keyToken);

  Future<void> setFirstName(String? name) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyFirstName, name ?? '');
    }
  }

  String getFirstName() =>
      _preferences?.getString(AppConstants.keyFirstName) ?? '';

  void _deleteFirstName() => _preferences?.remove(AppConstants.keyFirstName);

  Future<void> setLastName(String? name) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyLastName, name ?? '');
    }
  }

  String getLastName() =>
      _preferences?.getString(AppConstants.keyLastName) ?? '';

  void _deleteLastName() => _preferences?.remove(AppConstants.keyLastName);

  Future<void> setProfileImage(String? image) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyProfileImage, image ?? '');
    }
  }

  String getProfileImage() =>
      _preferences?.getString(AppConstants.keyProfileImage) ?? '';

  void _deleteProfileImage() =>
      _preferences?.remove(AppConstants.keyProfileImage);

  Future<void> setSavedShopsList(List<int> ids) async {
    if (_preferences != null) {
      final List<String> idsStrings = ids.map((e) => e.toString()).toList();
      await _preferences!
          .setStringList(AppConstants.keySavedStores, idsStrings);
    }
  }

  List<int> getSavedShopsList() {
    final List<String> strings =
        _preferences?.getStringList(AppConstants.keySavedStores) ?? [];
    final List<int> ids = strings.map((e) => int.parse(e)).toList();
    return ids;
  }

  void _deleteSavedShopsList() =>
      _preferences?.remove(AppConstants.keySavedStores);

  Future<void> setViewedProductsList(List<int> ids) async {
    if (_preferences != null) {
      final List<String> idsStrings = ids.map((e) => e.toString()).toList();
      await _preferences!
          .setStringList(AppConstants.keyViewedProducts, idsStrings);
    }
  }

  List<int> getViewedProductsList() {
    final List<String> stringIds =
        _preferences?.getStringList(AppConstants.keyViewedProducts) ?? [];
    final List<int> ids = stringIds.map((e) => int.parse(e)).toList();
    return ids;
  }

  void _deleteViewedProductsList() =>
      _preferences?.remove(AppConstants.keyViewedProducts);

  Future<void> setAddressSelected(bool selected) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyAddressSelected, selected);
    }
  }

  bool getAddressSelected() =>
      _preferences?.getBool(AppConstants.keyAddressSelected) ?? false;

  void _deleteAddressSelected() =>
      _preferences?.remove(AppConstants.keyAddressSelected);

  Future<void> setLanguageSelected(bool selected) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangSelected, selected);
    }
  }

  bool getLanguageSelected() =>
      _preferences?.getBool(AppConstants.keyLangSelected) ?? false;

  Future<void> setIsGuest(bool guest) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyIsGuest, guest);
    }
  }

  bool getIsGuest() => _preferences?.getBool(AppConstants.keyIsGuest) ?? false;

  void _deleteIsGuest() => _preferences?.remove(AppConstants.keyIsGuest);



  void _deleteLocalAddressesList() =>
      _preferences?.remove(AppConstants.keyLocalAddresses);

  Future<void> setNewAddresses(List<AddressData>? addresses) async {
    if (_preferences != null && addresses != null) {
      final List<String> newList =
          addresses.map((address) => jsonEncode(address.toJson())).toList();
      await _preferences!.setStringList(AppConstants.keyNewAddresses, newList);
    }
  }

  List<AddressData> getNewAddresses() {
    final List<String> addresses =
        _preferences?.getStringList(AppConstants.keyNewAddresses) ?? [];
    final List<AddressData> newAddresses = addresses
        .map(
          (address) => AddressData.fromJson(jsonDecode(address)),
        )
        .toList();
    return newAddresses;
  }

  void _deleteNewAddresses() =>
      _preferences?.remove(AppConstants.keyNewAddresses);

  Future<void> setActiveAddressTile(String title) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyActiveAddressTitle, title);
    }
  }

  String getActiveAddressTitle() =>
      _preferences?.getString(AppConstants.keyActiveAddressTitle) ?? '';

  void _deleteActiveAddressTile() =>
      _preferences?.remove(AppConstants.keyActiveAddressTitle);

  Future<void> setSelectedCurrency(CurrencyData currency) async {
    if (_preferences != null) {
      final String currencyString = jsonEncode(currency.toJson());
      await _preferences!
          .setString(AppConstants.keySelectedCurrency, currencyString);
    }
  }

  CurrencyData? getSelectedCurrency() {
    final savedString =
    _preferences?.getString(AppConstants.keySelectedCurrency);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return CurrencyData.fromJson(map);
  }

  void _deleteSelectedCurrency() =>
      _preferences?.remove(AppConstants.keySelectedCurrency);

  Future<void> setWalletData(Wallet? wallet) async {
    if (_preferences != null) {
      final String walletString = jsonEncode(wallet?.toJson());
      await _preferences!.setString(AppConstants.keyWalletData, walletString);
    }
  }

  Wallet? getWalletData() {
    final wallet = _preferences?.getString(AppConstants.keyWalletData);
    if (wallet == null) {
      return null;
    }
    final map = jsonDecode(wallet);
    if (map == null) {
      return null;
    }
    return Wallet.fromJson(map);
  }

  void _deleteWalletData() => _preferences?.remove(AppConstants.keyWalletData);

  Future<void> setLikedProductsList(List<int> ids) async {
    if (_preferences != null) {
      final List<String> stringList = ids.map((id) => id.toString()).toList();
      await _preferences!
          .setStringList(AppConstants.keyLikedProducts, stringList);
    }
  }

  List<int> getLikedProductsList() {
    final List<String> idsStrings =
        _preferences?.getStringList(AppConstants.keyLikedProducts) ?? [];
    final List<int> ids = idsStrings.map((id) => int.parse(id)).toList();
    return ids;
  }

  void _deleteLikedProductsList() =>
      _preferences?.remove(AppConstants.keyLikedProducts);

  Future<void> setCartProducts(List<CartProductData> products) async {
    if (_preferences != null) {
      final List<String> strings =
          products.map((product) => jsonEncode(product.toJson())).toList();
      await _preferences!.setStringList(AppConstants.keyCartProducts, strings);
    }
  }

  List<CartProductData> getCartProducts() {
    final List<String> products =
        _preferences?.getStringList(AppConstants.keyCartProducts) ?? [];
    final List<CartProductData> cartProducts = products
        .map(
          (product) => CartProductData.fromJson(jsonDecode(product)),
        )
        .toList();
    return cartProducts;
  }

  void deleteCartProducts() =>
      _preferences?.remove(AppConstants.keyCartProducts);

  Future<void> setSettingsList(List<SettingsData> settings) async {
    if (_preferences != null) {
      final List<String> strings =
          settings.map((setting) => jsonEncode(setting.toJson())).toList();
      await _preferences!
          .setStringList(AppConstants.keyGlobalSettings, strings);
    }
  }

  List<SettingsData> getSettingsList() {
    final List<String> settings =
        _preferences?.getStringList(AppConstants.keyGlobalSettings) ?? [];
    final List<SettingsData> settingsList = settings
        .map(
          (setting) => SettingsData.fromJson(jsonDecode(setting)),
        )
        .toList();
    return settingsList;
  }

  Future<void> setTranslations(Map<String, dynamic>? translations) async {
    if (_preferences != null) {
      final String encoded = jsonEncode(translations);
      await _preferences!.setString(AppConstants.keyTranslations, encoded);
    }
  }

  Map<String, dynamic> getTranslations() {
    final String encoded =
        _preferences?.getString(AppConstants.keyTranslations) ?? '';
    if (encoded.isEmpty) {
      return {};
    }
    final Map<String, dynamic> decoded = jsonDecode(encoded);
    return decoded;
  }

  Future<void> setAppThemeMode(bool isDarkMode) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyAppThemeMode, isDarkMode);
    }
  }

  bool getAppThemeMode() =>
      _preferences?.getBool(AppConstants.keyAppThemeMode) ?? false;

  Future<void> setLanguageData(LanguageData? langData) async {
    if (_preferences != null) {
      final String lang = jsonEncode(langData?.toJson());
      await _preferences!.setString(AppConstants.keyLanguageData, lang);
    }
  }

  LanguageData? getLanguage() {
    final lang = _preferences?.getString(AppConstants.keyLanguageData);
    if (lang == null) {
      return null;
    }
    final map = jsonDecode(lang);
    if (map == null) {
      return null;
    }
    return LanguageData.fromJson(map);
  }

  Future<void> setAuthenticatedWithSocial(bool withSocial) async {
    if (_preferences != null) {
      await _preferences!
          .setBool(AppConstants.keyAuthenticatedWithSocial, withSocial);
    }
  }

  bool getAuthenticatedWithSocial() =>
      _preferences?.getBool(AppConstants.keyAuthenticatedWithSocial) ?? false;

  void _deleteAuthenticatedWithSocial() =>
      _preferences?.remove(AppConstants.keyAuthenticatedWithSocial);

  Future<void> setLangLtr(int? backward) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangLtr, backward == 0);
    }
  }

  bool getLangLtr() => _preferences?.getBool(AppConstants.keyLangLtr) ?? true;

  void logout() {
    _deleteLikedProductsList();
    _deleteActiveAddressTile();
    _deleteLocalAddressesList();
    _deleteIsGuest();
    _deleteAddressSelected();
    _deleteViewedProductsList();
    _deleteSavedShopsList();
    _deleteProfileImage();
    _deleteLastName();
    _deleteFirstName();
    deleteToken();
    _deleteSelectedCurrency();
    deleteCartProducts();
    _deleteWalletData();
    _deleteUser();
    _deleteAuthenticatedWithSocial();
    _deleteNewAddresses();
  }
}
