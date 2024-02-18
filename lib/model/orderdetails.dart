class OrderDetails {
  bool? success;
  List<Data>? data;

  OrderDetails({this.success, this.data});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic date;
  String? orderID;
  dynamic paidAmount;
  dynamic discountAmount;
  dynamic redeemedRewards;
  String? coolerId;
  String? paymentStatus;
  dynamic amountDeductedByRewardPoint;
  dynamic amountDeductedByPaymentGateway;
  List<Product>? product;

  Data(
      {this.date,
        this.orderID,
        this.paidAmount,
        this.discountAmount,
        this.redeemedRewards,
        this.coolerId,
        this.paymentStatus,
        this.amountDeductedByRewardPoint,
        this.amountDeductedByPaymentGateway,
        this.product});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    orderID = json['orderID'];
    paidAmount = json['paidAmount'];
    discountAmount = json['discountAmount'];
    redeemedRewards = json['redeemedRewards'];
    coolerId = json['coolerId'];
    paymentStatus = json['paymentStatus'];
    amountDeductedByRewardPoint = json['amountDeductedByRewardPoint'];
    amountDeductedByPaymentGateway = json['amountDeductedByPaymentGateway'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['orderID'] = orderID;
    data['paidAmount'] = paidAmount;
    data['discountAmount'] = discountAmount;
    data['redeemedRewards'] = redeemedRewards;
    data['coolerId'] = coolerId;
    data['paymentStatus'] = paymentStatus;
    data['amountDeductedByRewardPoint'] = amountDeductedByRewardPoint;
    data['amountDeductedByPaymentGateway'] =
        amountDeductedByPaymentGateway;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? productName;
  dynamic productId;
  dynamic perProductPrice;
  dynamic productCount;
  String? productOtherUrl;
  String? productLocalName;
  String? currencyCode;
  String? currencyName;
  String? shortName;
  String? flavourName;
  String? packagingType;

  Product(
      {this.productName,
        this.productId,
        this.perProductPrice,
        this.productCount,
        this.productOtherUrl,
        this.productLocalName,
        this.currencyCode,
        this.currencyName,
        this.shortName,
        this.flavourName,
        this.packagingType});

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    productId = json['productId'];
    perProductPrice = json['perProductPrice'];
    productCount = json['productCount'];
    productOtherUrl = json['productOtherUrl'];
    productLocalName = json['productLocalName'];
    currencyCode = json['currencyCode'];
    currencyName = json['currencyName'];
    shortName = json['shortName'];
    flavourName = json['flavourName'];
    packagingType = json['packagingType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productName'] = productName;
    data['productId'] = productId;
    data['perProductPrice'] = perProductPrice;
    data['productCount'] = productCount;
    data['productOtherUrl'] = productOtherUrl;
    data['productLocalName'] = productLocalName;
    data['currencyCode'] = currencyCode;
    data['currencyName'] = currencyName;
    data['shortName'] = shortName;
    data['flavourName'] = flavourName;
    data['packagingType'] = packagingType;
    return data;
  }
}
