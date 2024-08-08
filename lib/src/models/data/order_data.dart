import 'shop_data.dart';
import 'translation.dart';
import 'user_data.dart';
import 'review_data.dart';
import 'coupon_data.dart';
import 'product_data.dart';
import 'address_data.dart';
import 'shop_delivery.dart';
import 'currency_data.dart';
import 'new_delivery_data.dart';

class OrderData {
  OrderData({
    int? id,
    int? userId,
    num? price,
    CouponData? coupon,
    num? deliveryFee,
    num? totalDeliveryFee,
    num? currencyPrice,
    num? rate,
    int? orderDetailsCount,
    String? createdAt,
    String? updatedAt,
    String? status,
    CurrencyData? currency,
    UserData? user,
    UserData? deliveryman,
    List<ShopOrderDetails>? details,
    ReviewData? review,
    Transaction? transaction,
    AddressData? userAddress,
    NewDeliveryData? delivery,
  }) {
    _id = id;
    _userId = userId;
    _price = price;
    _coupon = coupon;
    _deliveryFee = deliveryFee;
    _totalDeliveryFee = totalDeliveryFee;
    _currencyPrice = currencyPrice;
    _rate = rate;
    _orderDetailsCount = orderDetailsCount;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _status = status;
    _currency = currency;
    _user = user;
    _deliveryman = deliveryman;
    _details = details;
    _review = review;
    _transaction = transaction;
    _userAddress = userAddress;
    _delivery = delivery;
  }

  OrderData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _price = json['price'];
    _coupon = json['coupon'] != null
        ? CouponData.fromJson(json['coupon'])
        : null;
    // if(json['delivery']['price'] != null) {
    //   _deliveryFee = json['delivery']['price'];
    // }
    _totalDeliveryFee = json['total_delivery_fee'];
    _currencyPrice = json['currency_price'];
    _rate = json['rate'];
    _orderDetailsCount = json['order_details_count'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _status = json['status'];
    _currency = json['currency'] != null
        ? CurrencyData.fromJson(json['currency'])
        : null;
    _user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    _deliveryman = json['deliveryman'] != null ? UserData.fromJson(json['deliveryman']) : null;
    if (json['details'] != null) {
      _details = [];
      json['details'].forEach((v) {
        _details?.add(ShopOrderDetails.fromJson(v));
      });
    }
    _review =
        json['review'] != null ? ReviewData.fromJson(json['review']) : null;
    _transaction = json['transaction'] != null
        ? Transaction.fromJson(json['transaction'])
        : null;
    _userAddress = json['user_address'] != null
        ? AddressData.fromJson(json['user_address'])
        : null;
    _delivery = json['delivery'] != null
        ? NewDeliveryData.fromJson(json['delivery'])
        : null;
  }

  int? _id;
  int? _userId;
  num? _price;
  CouponData? _coupon;
  num? _deliveryFee;
  num? _totalDeliveryFee;
  num? _currencyPrice;
  num? _rate;
  int? _orderDetailsCount;
  String? _createdAt;
  String? _updatedAt;
  String? _status;
  CurrencyData? _currency;
  UserData? _user;
  UserData? _deliveryman;
  List<ShopOrderDetails>? _details;
  ReviewData? _review;
  Transaction? _transaction;
  AddressData? _userAddress;
  NewDeliveryData? _delivery;

  OrderData copyWith({
    int? id,
    int? userId,
    num? price,
    CouponData? coupon,
    num? deliveryFee,
    num? totalDeliveryFee,
    num? currencyPrice,
    num? rate,
    int? orderDetailsCount,
    String? createdAt,
    String? updatedAt,
    String? status,
    CurrencyData? currency,
    UserData? user,
    UserData? deliveryman,
    List<ShopOrderDetails>? details,
    ReviewData? review,
    Transaction? transaction,
    AddressData? userAddress,
    NewDeliveryData? delivery,
  }) =>
      OrderData(
        id: id ?? _id,
        userId: userId ?? _userId,
        price: price ?? _price,
        coupon: coupon ?? _coupon,
        deliveryFee: deliveryFee ?? _deliveryFee,
        totalDeliveryFee: totalDeliveryFee ?? _totalDeliveryFee,
        currencyPrice: currencyPrice ?? _currencyPrice,
        rate: rate ?? _rate,
        orderDetailsCount: orderDetailsCount ?? _orderDetailsCount,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        status: status ?? _status,
        currency: currency ?? _currency,
        user: user ?? _user,
        deliveryman: deliveryman ?? _deliveryman,
        details: details ?? _details,
        review: review ?? _review,
        transaction: transaction ?? _transaction,
        userAddress: userAddress ?? _userAddress,
        delivery: delivery ?? _delivery,
      );

  int? get id => _id;

  num? get userId => _userId;

  num? get price => _price;

  CouponData? get coupon => _coupon;

  num? get deliveryFee => _deliveryFee;

  num? get totalDeliveryFee => _totalDeliveryFee;

  num? get currencyPrice => _currencyPrice;

  num? get rate => _rate;

  int? get orderDetailsCount => _orderDetailsCount;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get status => _status;

  CurrencyData? get currency => _currency;

  UserData? get user => _user;

  UserData? get deliveryman => _deliveryman;

  List<ShopOrderDetails>? get details => _details;

  ReviewData? get review => _review;

  Transaction? get transaction => _transaction;

  AddressData? get userAddress => _userAddress;

  NewDeliveryData? get delivery => _delivery;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['price'] = _price;
    map['total_delivery_fee'] = _totalDeliveryFee;
    map['currency_price'] = _currencyPrice;
    map['rate'] = _rate;
    map['order_details_count'] = _orderDetailsCount;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_currency != null) {
      map['currency'] = _currency?.toJson();
    }
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_details != null) {
      map['details'] = _details?.map((v) => v.toJson()).toList();
    }
    if (_review != null) {
      map['review'] = _review?.toJson();
    }
    if (_transaction != null) {
      map['transaction'] = _transaction?.toJson();
    }
    if (_userAddress != null) {
      map['user_address'] = _userAddress?.toJson();
    }
    if (_delivery != null) {
      map['delivery'] = _delivery?.toJson();
    }
    return map;
  }
}

class ShopOrderDetails {
  ShopOrderDetails({
    int? id,
    int? shopId,
    num? deliveryFee,
    num? price,
    num? tax,
    String? status,
    String? deliveryDate,
    String? deliveryTime,
    String? createdAt,
    String? updatedAt,
    List<OrderStocks>? orderStocks,
    CouponData? coupon,
    AddressData? deliveryAddress,
    dynamic deliveryman,
    ShopDelivery? deliveryType,
    // List<dynamic>? transactions,
    ShopData? shop,
  }) {
    _id = id;
    _shopId = shopId;
    _deliveryFee = deliveryFee;
    _price = price;
    _tax = tax;
    _status = status;
    _deliveryDate = deliveryDate;
    _deliveryTime = deliveryTime;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _orderStocks = orderStocks;
    _coupon = coupon;
    _deliveryAddress = deliveryAddress;
    _deliveryman = deliveryman;
    _deliveryType = deliveryType;
    // _transactions = transactions;
    _shop = shop;
  }

  ShopOrderDetails.fromJson(dynamic json) {
    _id = json['id'];
    _shopId = json['shop_id'];
    _deliveryFee = json['delivery_fee'];
    _price = json['price'];
    _tax = json['tax'];
    _status = json['status'];
    _deliveryDate = json['delivery_date'];
    _deliveryTime = json['delivery_time'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['order_stocks'] != null) {
      _orderStocks = [];
      json['order_stocks'].forEach((v) {
        _orderStocks?.add(OrderStocks.fromJson(v));
      });
    }
    _coupon =
        json['coupon'] != null ? CouponData.fromJson(json['coupon']) : null;
    _deliveryAddress = json['delivery_address'] != null
        ? AddressData.fromJson(json['delivery_address'])
        : null;
    _deliveryman = json['deliveryman'];
    _deliveryType = json['delivery_type'] != null
        ? ShopDelivery.fromJson(json['delivery_type'])
        : null;
    // if (json['transactions'] != null) {
    //   _transactions = [];
    //   json['transactions'].forEach((v) {
    //     _transactions?.add(Dynamic.fromJson(v));
    //   });
    // }
    _shop = json['shop'] != null ? ShopData.fromJson(json['shop']) : null;
  }

  int? _id;
  int? _shopId;
  num? _deliveryFee;
  num? _price;
  num? _tax;
  String? _status;
  String? _deliveryDate;
  String? _deliveryTime;
  String? _createdAt;
  String? _updatedAt;
  List<OrderStocks>? _orderStocks;
  CouponData? _coupon;
  AddressData? _deliveryAddress;
  dynamic _deliveryman;
  ShopDelivery? _deliveryType;

  // List<dynamic>? _transactions;
  ShopData? _shop;

  ShopOrderDetails copyWith({
    int? id,
    int? shopId,
    num? deliveryFee,
    num? price,
    num? tax,
    String? status,
    String? deliveryDate,
    String? deliveryTime,
    String? createdAt,
    String? updatedAt,
    List<OrderStocks>? orderStocks,
    CouponData? coupon,
    AddressData? deliveryAddress,
    dynamic deliveryman,
    ShopDelivery? deliveryType,
    // List<dynamic>? transactions,
    ShopData? shop,
  }) =>
      ShopOrderDetails(
        id: id ?? _id,
        shopId: shopId ?? _shopId,
        deliveryFee: deliveryFee ?? _deliveryFee,
        price: price ?? _price,
        tax: tax ?? _tax,
        status: status ?? _status,
        deliveryDate: deliveryDate ?? _deliveryDate,
        deliveryTime: deliveryTime ?? _deliveryTime,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        orderStocks: orderStocks ?? _orderStocks,
        coupon: coupon ?? _coupon,
        deliveryAddress: deliveryAddress ?? _deliveryAddress,
        deliveryman: deliveryman ?? _deliveryman,
        deliveryType: deliveryType ?? _deliveryType,
        // transactions: transactions ?? _transactions,
        shop: shop ?? _shop,
      );

  int? get id => _id;

  int? get shopId => _shopId;

  num? get deliveryFee => _deliveryFee;

  num? get price => _price;

  num? get tax => _tax;

  String? get status => _status;

  String? get deliveryDate => _deliveryDate;

  String? get deliveryTime => _deliveryTime;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  List<OrderStocks>? get orderStocks => _orderStocks;

  CouponData? get coupon => _coupon;

  AddressData? get deliveryAddress => _deliveryAddress;

  dynamic get deliveryman => _deliveryman;

  ShopDelivery? get deliveryType => _deliveryType;

  // List<dynamic>? get transactions => _transactions;
  ShopData? get shop => _shop;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['shop_id'] = _shopId;
    map['delivery_fee'] = _deliveryFee;
    map['price'] = _price;
    map['tax'] = _tax;
    map['status'] = _status;
    map['delivery_date'] = _deliveryDate;
    map['delivery_time'] = _deliveryTime;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_orderStocks != null) {
      map['order_stocks'] = _orderStocks?.map((v) => v.toJson()).toList();
    }
    if (_deliveryAddress != null) {
      map['delivery_address'] = _deliveryAddress?.toJson();
    }
    map['deliveryman'] = _deliveryman;
    if (_deliveryType != null) {
      map['delivery_type'] = _deliveryType?.toJson();
    }
    // if (_transactions != null) {
    //   map['transactions'] = _transactions?.map((v) => v.toJson()).toList();
    // }
    if (_shop != null) {
      map['shop'] = _shop?.toJson();
    }
    return map;
  }
}

class OrderStocks {
  OrderStocks({
    int? id,
    int? stockId,
    num? originPrice,
    num? tax,
    num? discount,
    int? quantity,
    num? totalPrice,
    String? createdAt,
    String? updatedAt,
    Stocks? stock,
  }) {
    _id = id;
    _stockId = stockId;
    _originPrice = originPrice;
    _tax = tax;
    _discount = discount;
    _quantity = quantity;
    _totalPrice = totalPrice;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _stock = stock;
  }

  OrderStocks.fromJson(dynamic json) {
    _id = json['id'];
    _stockId = json['stock_id'];
    _originPrice = json['origin_price'];
    _tax = json['tax'];
    _discount = json['discount'];
    _quantity = json['quantity'];
    _totalPrice = json['total_price'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _stock = json['stock'] != null ? Stocks.fromJson(json['stock']) : null;
  }

  int? _id;
  int? _stockId;
  num? _originPrice;
  num? _tax;
  num? _discount;
  int? _quantity;
  num? _totalPrice;
  String? _createdAt;
  String? _updatedAt;
  Stocks? _stock;

  OrderStocks copyWith({
    int? id,
    int? stockId,
    num? originPrice,
    num? tax,
    num? discount,
    int? quantity,
    num? totalPrice,
    String? createdAt,
    String? updatedAt,
    Stocks? stock,
  }) =>
      OrderStocks(
        id: id ?? _id,
        stockId: stockId ?? _stockId,
        originPrice: originPrice ?? _originPrice,
        tax: tax ?? _tax,
        discount: discount ?? _discount,
        quantity: quantity ?? _quantity,
        totalPrice: totalPrice ?? _totalPrice,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        stock: stock ?? _stock,
      );

  int? get id => _id;

  num? get stockId => _stockId;

  num? get originPrice => _originPrice;

  num? get tax => _tax;

  num? get discount => _discount;

  int? get quantity => _quantity;

  num? get totalPrice => _totalPrice;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Stocks? get stock => _stock;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['stock_id'] = _stockId;
    map['origin_price'] = _originPrice;
    map['tax'] = _tax;
    map['discount'] = _discount;
    map['quantity'] = _quantity;
    map['total_price'] = _totalPrice;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_stock != null) {
      map['stock'] = _stock?.toJson();
    }
    return map;
  }
}

class Transaction {
  Transaction({
    int? id,
    String? payableType,
    int? payableId,
    num? price,
    int? userId,
    int? paymentSysId,
    dynamic paymentTrxId,
    String? note,
    String? performTime,
    dynamic refundTime,
    String? status,
    String? statusDescription,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
    PaymentSystem? paymentSystem,
  }) {
    _id = id;
    _payableType = payableType;
    _payableId = payableId;
    _price = price;
    _userId = userId;
    _paymentSysId = paymentSysId;
    _paymentTrxId = paymentTrxId;
    _note = note;
    _performTime = performTime;
    _refundTime = refundTime;
    _status = status;
    _statusDescription = statusDescription;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _paymentSystem = paymentSystem;
  }

  Transaction.fromJson(dynamic json) {
    _id = json['id'];
    _payableType = json['payable_type'];
    _payableId = json['payable_id'];
    _price = json['price'];
    _userId = json['user_id'];
    _paymentSysId = json['payment_sys_id'];
    _paymentTrxId = json['payment_trx_id'];
    _note = json['note'];
    _performTime = json['perform_time'];
    _refundTime = json['refund_time'];
    _status = json['status'];
    _statusDescription = json['status_description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _paymentSystem = json['payment_system'] != null
        ? PaymentSystem.fromJson(json['payment_system'])
        : null;
  }

  int? _id;
  String? _payableType;
  int? _payableId;
  num? _price;
  int? _userId;
  int? _paymentSysId;
  dynamic _paymentTrxId;
  String? _note;
  String? _performTime;
  dynamic _refundTime;
  String? _status;
  String? _statusDescription;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  PaymentSystem? _paymentSystem;

  Transaction copyWith({
    int? id,
    String? payableType,
    int? payableId,
    num? price,
    int? userId,
    int? paymentSysId,
    dynamic paymentTrxId,
    String? note,
    String? performTime,
    dynamic refundTime,
    String? status,
    String? statusDescription,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
    PaymentSystem? paymentSystem,
  }) =>
      Transaction(
        id: id ?? _id,
        payableType: payableType ?? _payableType,
        payableId: payableId ?? _payableId,
        price: price ?? _price,
        userId: userId ?? _userId,
        paymentSysId: paymentSysId ?? _paymentSysId,
        paymentTrxId: paymentTrxId ?? _paymentTrxId,
        note: note ?? _note,
        performTime: performTime ?? _performTime,
        refundTime: refundTime ?? _refundTime,
        status: status ?? _status,
        statusDescription: statusDescription ?? _statusDescription,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        deletedAt: deletedAt ?? _deletedAt,
        paymentSystem: paymentSystem ?? _paymentSystem,
      );

  int? get id => _id;

  String? get payableType => _payableType;

  int? get payableId => _payableId;

  num? get price => _price;

  int? get userId => _userId;

  int? get paymentSysId => _paymentSysId;

  dynamic get paymentTrxId => _paymentTrxId;

  String? get note => _note;

  String? get performTime => _performTime;

  dynamic get refundTime => _refundTime;

  String? get status => _status;

  String? get statusDescription => _statusDescription;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  dynamic get deletedAt => _deletedAt;

  PaymentSystem? get paymentSystem => _paymentSystem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['payable_type'] = _payableType;
    map['payable_id'] = _payableId;
    map['price'] = _price;
    map['user_id'] = _userId;
    map['payment_sys_id'] = _paymentSysId;
    map['payment_trx_id'] = _paymentTrxId;
    map['note'] = _note;
    map['perform_time'] = _performTime;
    map['refund_time'] = _refundTime;
    map['status'] = _status;
    map['status_description'] = _statusDescription;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    if (_paymentSystem != null) {
      map['payment_system'] = _paymentSystem?.toJson();
    }
    return map;
  }
}

class PaymentSystem {
  PaymentSystem({
    int? id,
    String? tag,
    bool? active,
    Translation? translation,
  }) {
    _id = id;
    _tag = tag;
    _active = active;
    _translation = translation;
  }

  PaymentSystem.fromJson(dynamic json) {
    _id = json['id'];
    _tag = json['tag'];
    _active = json['active'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  int? _id;
  String? _tag;
  bool? _active;
  Translation? _translation;

  PaymentSystem copyWith({
    int? id,
    String? tag,
    bool? active,
    Translation? translation,
  }) =>
      PaymentSystem(
        id: id ?? _id,
        tag: tag ?? _tag,
        active: active ?? _active,
        translation: translation ?? _translation,
      );

  int? get id => _id;

  String? get tag => _tag;

  bool? get active => _active;

  Translation? get translation => _translation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['tag'] = _tag;
    map['active'] = _active;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}
