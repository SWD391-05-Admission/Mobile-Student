import 'package:mobile_customer/models/university.dart';

class Major {
  String code;
  String name;
  List<University> listUniversity;

  Major({
    this.code,
    this.name,
    this.listUniversity,
  });

  static Major createMajor() {
    List<University> listUniversity = University.createListUniversity();
    Major major = Major(
      code: 'se',
      listUniversity: listUniversity,
      name: 'Software Engineer',
    );
    return major;
  }
}
