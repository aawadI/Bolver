import 'package:google_maps_flutter/google_maps_flutter.dart';

class NewAddressRequest {
  final String firstname;
  final String lastname;
  final String birthday;
  final String email;
  final String phone;
  final String apartment;
  final String townCity;
  final String? postcode;
  final String passportNumber;
  final String passportSecret;
  final String gender;
  final String addressTitle;
  final String address;
  final LatLng location;
  final String? stateProvince;
  final String? companyName;
  final String? note;

  NewAddressRequest({
    required this.firstname,
    required this.lastname,
    required this.birthday,
    required this.email,
    required this.phone,
    required this.apartment,
    required this.townCity,
    required this.passportNumber,
    required this.passportSecret,
    required this.gender,
    required this.addressTitle,
    required this.address,
    required this.location,
    this.postcode,
    this.stateProvince,
    this.companyName,
    this.note,
  });
}
