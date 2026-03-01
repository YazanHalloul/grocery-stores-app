class StoreEntity {
  final LocalizedText? name;
  final LocalizedText? description;
  final MinimumOrder? minimumOrder;
  final Address? address;
  final String? estimatedDeliveryTime;
  final String? coverPhoto;
  final bool availability;

  const StoreEntity({
    this.name,
    this.description,
    this.minimumOrder,
    this.address,
    this.estimatedDeliveryTime,
    this.coverPhoto,
    required this.availability,
  });
}

class LocalizedText {
  final String? en;
  final String? ar;

  const LocalizedText({this.en, this.ar});
}

class MinimumOrder {
  final int amount;
  final String currency;

  const MinimumOrder({required this.amount, required this.currency});
}

class Address {
  String? city;
  String? country;
  String? otherDetails;
  String? state;
  String? street;

  Address({
    this.city,
    this.country,
    this.otherDetails,
    this.state,
    this.street,
  });

}

