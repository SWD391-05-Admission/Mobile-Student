import 'package:intl/intl.dart';

class User {
  String email;
  String fullName;
  String phone;
  String image;
  String address;
  String description;
  String gender;
  DateTime birthday;

  User(
      {this.email,
      this.fullName,
      this.phone,
      this.image,
      this.address,
      this.description,
      this.gender,
      this.birthday});

  static User createUser() {
    DateTime birthday = DateTime.parse('2000-01-01 03:07:00');
    User newUser = User(
      email: 'demo@gmail.com',
      fullName: 'Demo',
      phone: '0961191730',
      image:
          'https://danongonline.com.vn/wp-content/uploads/2018/02/anh-girl-xinh-mat-moc-9.jpg',
      address: 'A15/5 Đường sô 441, Lê Văn Việt, Quận 9, Thành Phố Thủ Đức',
      description: 'I am a handsome boy, I love pink and hate lies',
      gender: 'Male',
      birthday: birthday,
    );
    return newUser;
  }

  static List<User> createListConsulant() {
    List<User> list = [];
    for (int i = 0; i < 10; i++) {
      User newUser = User(
        email: 'consultant$i@gmail.com',
        fullName: 'consultant$i',
        phone: '096119123$i',
        image:
            'https://1.bp.blogspot.com/-GFEx6MCOc5U/YQnlwK9rt7I/AAAAAAAAv2Y/5atxGCDP3f04gnoEcPozTfn04478FFFlQCNcBGAsYHQ/s0/avatar-anime.jpg',
        address: '$i Lã Xuân Oai, Quận 9, TP HCM',
        description: 'Consultant$i is a handsome boy, I like fishing',
        gender: 'Male',
        birthday: DateTime.parse('200$i-01-01 03:07:00'),
      );
      list.add(newUser);
    }
    return list;
  }
}
