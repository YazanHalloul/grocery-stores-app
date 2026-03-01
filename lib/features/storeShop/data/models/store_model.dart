import 'package:technical_assignment/features/storeShop/domain/entities/store.dart';

class StoreModel {
  final LocalizedTextModel name;
  final LocalizedTextModel description;
  final MinimumOrderModel minimumOrder;
  final AddressModel address;
  final String estimatedDeliveryTime;
  final String coverPhoto;
  final bool availability;

  StoreModel({
    required this.name,
    required this.description,
    required this.minimumOrder,
    required this.address,
    required this.estimatedDeliveryTime,
    required this.coverPhoto,
    required this.availability,
  });
  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      name: LocalizedTextModel.fromJson(json['shopName']),
      description: LocalizedTextModel.fromJson(json['description']),
      minimumOrder: MinimumOrderModel.fromJson(json['minimumOrder']),
      address: AddressModel.fromJson(json['address']),
      estimatedDeliveryTime: json['estimatedDeliveryTime'],
      coverPhoto: json['coverPhoto'],
      availability: json['availability'],
    );
  }

  StoreEntity toEntity() {
    return StoreEntity(
      name: name.toEntity(),
      description: description.toEntity(),
      minimumOrder: minimumOrder.toEntity(),
      address: address.toEntity(),
      estimatedDeliveryTime: estimatedDeliveryTime,
      coverPhoto: coverPhoto,
      availability: availability,
    );
  }
}

class LocalizedTextModel {
  final String? en;
  final String? ar;

  LocalizedTextModel({this.en, this.ar});

  factory LocalizedTextModel.fromJson(Map<String, dynamic> json) {
    return LocalizedTextModel(en: json['en'], ar: json['ar']);
  }

  LocalizedText toEntity() {
    return LocalizedText(en: en, ar: ar);
  }
}

class MinimumOrderModel {
  final int amount;
  final String currency;

  MinimumOrderModel({required this.amount, required this.currency});

  factory MinimumOrderModel.fromJson(Map<String, dynamic> json) {
    return MinimumOrderModel(
      amount: json['amount'],
      currency: json['currency'],
    );
  }

  MinimumOrder toEntity() {
    return MinimumOrder(amount: amount, currency: currency);
  }
}

class AddressModel {
  String? city;
  String? country;
  String? otherDetails;
  String? state;
  String? street;

  AddressModel({
    this.city,
    this.country,
    this.otherDetails,
    this.state,
    this.street,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      city: json['city'],
      country: json['country'],
      otherDetails: json['otherDetails'],
      state: json['state'],
      street: json['street'],
    );
  }

  Address toEntity() {
    return Address(
      city: city,
      country: country,
      otherDetails: otherDetails,
      state: state,
      street: street,
    );
  }
}
