class Counselor {
  int ID;
  String email;
  String fullName;
  String phone;
  String image;
  String address;
  String description;
  String gender;
  String birthday;

  Counselor({
    this.ID,
    this.email,
    this.fullName,
    this.phone,
    this.image,
    this.address,
    this.description,
    this.gender,
    this.birthday,
  });

  static List<Counselor> createListCounselor() {
    List<Counselor> list = [];
    for (int i = 0; i < 10; i++) {
      Counselor newCounselor = Counselor(
        ID: i,
        address: 'A15/5 Đường số 441, Lê Văn Việt $i',
        birthday: '03-07-2000',
        description:
            'I am a beautiful girl, I love my self. My favorite are fishing and playing football.',
        email: 'counselor@gmail.com',
        fullName: 'Lê Duy Tuấn Vũ',
        gender: 'Nam',
        image:
            'https://media.istockphoto.com/vectors/child-in-psychologist-office-flat-illustration-vector-id1144461818?k=20&m=1144461818&s=612x612&w=0&h=rTNpGQEh6CoI4JlE5x-238feznFCterp58FnxiRttT0=',
        phone: '0961191733',
      );
      list.add(newCounselor);
    }
    return list;
  }
}
