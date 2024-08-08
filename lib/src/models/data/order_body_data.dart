class OrderBodyData {
  final int userId;
  final num total;
  final int currencyId;
  final int deliveryId;
  final num currencyRate;
  final String? note;
  final String? coupon;
  final String? deliveryType;
  final List<ShopOrder> shops;

  OrderBodyData({
    required this.userId,
    required this.total,
    required this.currencyId,
    required this.deliveryId,
    required this.currencyRate,
    this.note,
    this.coupon,
    this.deliveryType,
    required this.shops,
  });

  @override
  String toString() {
    return "{\"user_id\":$userId, \"total\":$total, \"currency_id\":$currencyId, \"delivery_id\":$deliveryId, \"rate\":$currencyRate, \"note\":\"$note\", \"coupon\":\"$coupon\", \"shops\":$shops, \"delivery_type\": $deliveryType}";
  }
}

class ShopOrder {
  final int shopId;
  final int? deliveryAddressId;
  final num? deliveryFee;
  final int? deliveryTypeId;
  final String? coupon;
  final String? deliveryDate;
  final String? deliveryTime;
  final num tax;
  final List<ProductOrder> products;

  ShopOrder({
    required this.shopId,
    required this.tax,
    required this.products,
    this.deliveryFee,
    this.deliveryTypeId,
    this.deliveryAddressId,
    this.coupon,
    this.deliveryDate,
    this.deliveryTime,
  });

  @override
  String toString() {
    return "{\"shop_id\":$shopId, \"delivery_address_id\":$deliveryAddressId, \"delivery_fee\":$deliveryFee, \"delivery_type_id\":$deliveryTypeId, \"coupon\":\"$coupon\", \"delivery_date\":\"$deliveryDate\", \"delivery_time\":\"$deliveryTime\", \"tax\":$tax, \"products\":$products}";
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shop_id'] = shopId;
    map['delivery_address_id'] = deliveryAddressId;
    map['delivery_fee'] = deliveryFee;
    map['delivery_type_id'] = deliveryTypeId;
    map['coupon'] = coupon;
    map['delivery_date'] = deliveryDate;
    map['delivery_time'] = deliveryTime;
    map['tax'] = tax;
    return map;
  }
}

class ProductOrder {
  final int shopId;
  final int stockId;
  final num price;
  final int quantity;
  final num tax;
  final num discount;
  final num totalPrice;

  ProductOrder({
    required this.shopId,
    required this.stockId,
    required this.price,
    required this.quantity,
    required this.tax,
    required this.discount,
    required this.totalPrice,
  });

  @override
  String toString() {
    return "{\"product_id\":$stockId, \"price\":$price, \"qty\":$quantity, \"tax\":$tax, \"discount\":$discount, \"total_price\":$totalPrice}";
  }
}
