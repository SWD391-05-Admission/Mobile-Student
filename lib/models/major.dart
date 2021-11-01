import 'package:mobile_customer/models/university.dart';

class Major {
  int id;
  String name;
  String description;

  Major({
    this.id,
    this.name,
    this.description,
  });

  // static Major createMajor() {
  //   List<University> listUniversity = University.createListUniversity();
  //   Major major = Major(
  //     code: 'se',
  //     listUniversity: listUniversity,
  //     name: 'Software Engineer',
  //   );
  //   return major;
  // }
}
