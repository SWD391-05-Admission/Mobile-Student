import 'package:mobile_customer/models/distric.dart';

class Address {
  int ID;
  String address;
  District district;

  Address({this.ID, this.address, this.district});

  static List<Address> createListAddress() {
    List<Address> list = [];
    for (int i = 0; i < 10; i++) {
      Address newAddress = Address(
        address: '$i Lã Xuân Oai',
        district: District(ID: 1, name: ''),
      );
      list.add(newAddress);
    }
    return list;
  }
}
