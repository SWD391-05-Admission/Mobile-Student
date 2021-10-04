class Address {
  String address;
  String district;

  Address({this.address, this.district});

  static List<Address> createListAddress() {
    List<Address> list = [];
    for (int i = 0; i < 10; i++) {
      Address newAddress = Address(
        address: '$i Lã Xuân Oai',
        district: 'Quận $i',
      );
      list.add(newAddress);
    }
    return list;
  }
}
