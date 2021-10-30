import 'package:mobile_customer/models/address.dart';

class University {
  int ID;
  String code;
  String name;
  String email;
  String facebook;
  String website;
  String description;
  double lastYearBenchMark;
  double minFee;
  double maxFee;
  List<Address> listAddress;
  String image;

  University({
    this.ID,
    this.code,
    this.name,
    this.email,
    this.facebook,
    this.website,
    this.description,
    this.lastYearBenchMark,
    this.minFee,
    this.maxFee,
    this.listAddress,
    this.image,
  });

  static List<University> createListUniversity() {
    List<University> list = [];
    for (int i = 0; i < 10; i++) {
      University newUniversity = University(
        code: '$i',
        name: 'University $i',
        email: 'univer$i@gmail.com',
        facebook: 'facebook$i',
        website: 'website$i',
        description: 'This is a description of university $i',
        lastYearBenchMark: i.toDouble(),
        minFee: i.toDouble() + 100,
        maxFee: i.toDouble() + 1000,
        listAddress: Address.createListAddress(),
        image:
            'http://indec.vn/wp-content/uploads/2019/01/university-of-birmingham-.jpg',
      );
      list.add(newUniversity);
    }
    return list;
  }
}
